require "update/commands"
require "update/rainbow"
require "update/version"

module Update
  extend Rainbow

  class << self
    def run
      Update::COMMANDS.each do |commands|
        commands.each do |command, description|
          green description
          puts `#{command}`
          take_note_of_failures command
        end
      end
      report_final_status
    end
    
    private

    def take_note_of_failures command
      unless $?.success?
        @failed ||= []
        @failed << @command
        @failure_report = "Command failed: '#{command}'"
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