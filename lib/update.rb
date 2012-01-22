require "update/version"
require "update/red-green"
require "update/commands"
require "slop"

module Update
  extend RedGreen

  class << self
    def run
      run_each_command
      report_final_status
    end
    
    private
    
    def run_each_command
      COMMANDS.each do |command, task|
        green task
        puts `#{command}`
        check_for_failures
      end
    end
    
    def check_for_failures
      unless $?.success?
        @failed = true
        red "Command failed."
      end
    end

    def report_final_status
      unless @failed
        green "Update process completed successfully."
      else
        red "Update process completed with failures.\a"
      end
    end
  end
end