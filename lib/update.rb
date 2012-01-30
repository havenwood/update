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
          run_in_new_thread.join { report_status }
        end
      end
    end
    
    private
    
    def run_in_new_thread
      Thread.new do
        @commands.each do |command, description|
          @command, @description = command, description
          run_command
          check_exit_status
          printout
        end
      end.run
    end
    
    def run_command
      @command_output = `#{@command}`
    end

    def check_exit_status
      unless $?.success?
        @failed ||= []
        @failed << @command
        @failure_report = "Command failed: '#{@command}'"
      end
    end
    
    def printout
      green @description
      puts @command_output
      red @failure_report if @failure_report
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