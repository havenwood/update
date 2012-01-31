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
          @fiber = Fiber.new { run_commands }.resume
        end
      end
    end
    
    private
    
    def run_commands
      @commands.each do |command, description|
          @command, @description = command, description
            green description
            puts run_command
            red check_exit_status
          end
        end
      end
    end
    
    def run_command
      `#{@command}`
    end

    def check_exit_status
      unless $?.success?
        @failed ||= []
        @failed << @command
        @failure_report = "Command failed: '#{@command}'"
        red @failure_report if @failure_report
      end
    end
    
    def report_status
      if @failed
        red "Update process completed with failures.\a" #chirp
        @failed.each { |this_failed| puts "Command failed: '#{this_failed}'" }
      else
        green "Update process completed successfully."
      end
    end
  end
end