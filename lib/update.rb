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
      Update::COMMANDS.each do |command, description|
        green description
        run_command_and_print_output
        check_for_failures command
      end
    end
    
    def run_command_and_print_output
      IO.popen(command) do |io|
        puts io.readline
      end
    ensure
      io.close
    end
    
    def check_for_failures command
      unless $?.success?
        @failed ||= []
        @failed << command
        red "Command failed."
      end
    end

    def report_status
      if @failed
        red "Update process completed with failures.\a" #chirp
        @failed.each { |command| puts "Command failed: '#{command}'" }
      else
        green "Update process completed successfully."
      end
    end
  end
end