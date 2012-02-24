require "update/options"
require "update/commands"
require "update/red-green"
require "update/version"

module Update
  extend RedGreen

  class << self
    def run
      Update::COMMANDS.each do |command, description|
        @command = command
        green description
        puts `#@command`
        take_note_if_command_fails
      end
      report_final_status
    end

    private

    def take_note_if_command_fails
      unless $?.success?
        @failed ||= []
        @failed << @command
        red "Command failed: '#@command'"
      end
    end
    
    def report_final_status
      if @failed
        red "Update process completed with failures.\a" #chirp
        @failed.each { |this_failed| puts "Command failed: '#{this_failed}'" }
        exit 1
      else
        green "Update process completed successfully."
      end
    end
  end
end