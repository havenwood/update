require "update/commands"
require "update/rainbow"
require "update/version"

module Update
  extend Rainbow

  class << self
    def run
      Update::COMMANDS.each do |command, description|
        green description
        plain `#{command}`
        take_note_of_failures command
      end
      report_final_status
    end
    
    private

    def take_note_of_failures command
      unless $?.success?
        @failed ||= []
        @failed << command
        red "Command failed: '#{command}'"
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