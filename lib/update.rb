require "update/commands"
require "update/rainbow"
require "update/version"

module Update
  extend Rainbow

  class << self
    def run
      Update::COMMANDS.each |commands|
        @commands = commands
        run_commands
      end
      report_final_status
    end
    
    private
    
    def run_commands
      @commands.each do |command, description|
        @command, @description = command, description
        run_command
        take_note_of_failures
      end
    end
    
    def run_command
      green @description
      puts `#{@command}`
    end

    def take_note_of_failures
      unless $?.success?
        @failed ||= []
        @failed << @command
        @failure_report = "Command failed: '#{@command}'"
        red @failure_report if @failure_report
      end
    end
    
    def report_final_status
      if @failed
        red "Update process completed with failures.\a" #chirp
        @failed.each { |this_failed| puts "Command failed: '#{this_failed}'" }
      else
        green "Update process completed successfully."
      end
    end
  end
end