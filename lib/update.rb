require "update/commands"
require "update/red-green"
require "update/version"

module Update
  extend RedGreen
  
  class << self
    def run
      run_each_command
      report_final_status
    end
    
    private
    
    def run_each_command
      Update::COMMANDS.each do |command, description|
        green description
        puts `#{command}`
        check_for_failures command
      end
    end
    
    def check_for_failures command
      unless $?.success?
        @failed_commands ||= []
        @failed_commands << command
        red "Command failed."
      end
    end

    def report_final_status
      if @failed_commands
        red "Update process completed with failures.\a" #chirp
        @failed_commands.each { |failed_command| puts "Command failed: '#{failed_command}'" }
      else
        green "Update process completed successfully."
      end
    end
  end
end