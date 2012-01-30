require "update/commands"
require "update/red-green"
require "update/version"

module Update
  extend RedGreen

  class << self
    def run
      run_commands
      report_status
    end
    
    private
    
    def run_commands
      Update::COMMANDS.each do |groups_of_commands|
        groups_of_commands.each do |run_together|
          @group = run_together
          run_group_in_new_thread
        end
      end
    end
      
    def run_group_in_new_thread
      Thread.new do
        @group.each do |command, description|
          @command, @description = command, description
          run_command
          check_exit_status
          printout
        end
      end
    end
    
    def run_command
      `#{command}`
      @command_output = _
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