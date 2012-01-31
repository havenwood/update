require "update/commands"
require "update/rainbow"
require "update/version"

module Update
  extend Rainbow

  class << self
    def run
      Update::COMMANDS.each do |together|
        together.each do |run_together|
          @commands = run_together
          run_in_new_thread  { report_status }
        end
      end
    end
    
    private
    
    def run_fibers
      @commands.each do |command, description|
          @command, @description = command, description
          @fiber = Fiber.new do
            run_command
            check_exit_status
            printout
          end.resume
        end
      end
    end
    
    def run_command
      @fiber.yield puts `#{@command}`
    end

    def check_exit_status
      unless $?.success?
        @failed ||= []
        @failed << @command
        @failure_report = "Command failed: '#{@command}'"
      end
    end
    
    def printout
      @fiber.yield green @description
      @fiber.yield puts @command_output
      @fiber.yield red @failure_report if @failure_report
    end
    
    def report_status
      if @failed
        @fiber.yield red "Update process completed with failures.\a" #chirp
        @failed.each { |this_failed| puts "Command failed: '#{this_failed}'" }
      else
        @fiber.yield green "Update process completed successfully."
      end
    end
  end
end