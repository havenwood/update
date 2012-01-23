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
        check_for_failures
      end
    end
    
    def check_for_failures
      @status ||= "status"
      unless $?.success?
        @status.taint
        red "Command failed."
      end
    end

    def report_final_status
      unless @status.tainted?
        green "Update process completed successfully."
      else
        red "Update process completed with failures.\a" #chirp
      end
    end
  end
end