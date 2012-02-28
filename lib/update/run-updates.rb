module Update
  extend RedGreen

  class << self
    def run
      EM.synchrony do
        EM::Synchrony::FiberIterator.new(Update::COMMAND_GROUPS).each do |commands|
          commands.each do |command, description|
            @command = command

            @results ||= {}
            @results["#{description}"] = `#@command`

            take_note_if_command_fails
          end

          @results.each do |description, result|
            green description
            puts result
          end
        end

        EventMachine.stop
      end
      
      report_final_status
    end

    private

    def take_note_if_command_fails
      unless $?.success?
        @failed ||= []
        @failed << @command
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