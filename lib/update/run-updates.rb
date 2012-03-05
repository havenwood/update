module Update
  extend RedGreen

  class << self
    def run
      asynchronously_iterate_over_command_groups
      
      report_final_status
    end

    private

    def asynchronously_iterate_over_command_groups
      Update::COMMAND_GROUPS.each! do |commands|
        commands.each do |command, description|
          @results ||= {}
          @results["#{description}"] = `#{command}`

          unless $?.success?
            @failed ||= []
            @failed << command
          end
        end

        display_results_of_command_group
      end
    end

    def display_results_of_command_group
      @results.each do |description, result|
        green description
        puts result
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