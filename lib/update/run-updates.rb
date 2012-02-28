module Update
  extend RedGreen

  class << self
    def run
      EM.synchrony do
        asynchronously_iterate_over_command_groups
      end
      
      report_final_status
    end

    private

    def asynchronously_iterate_over_command_groups
      EM::Synchrony::FiberIterator.new(Update::COMMAND_GROUPS).each do |commands|
        @commands = commands

        synchronously_run_commands_within_each_command_group
      end

      EventMachine.stop
    end

    def synchronously_run_commands_within_each_command_group
      @commands.each do |command, description|
        @command, @description = command, description

        run_commands_in_each_command_group

        take_note_if_command_fails
      end

      display_results_of_command_group
    end

    def run_commands_in_each_command_group
      @results ||= {}
      @results["#{@description}"] = `#@command`
    end

    def take_note_if_command_fails
      unless $?.success?
        @failed ||= []
        @failed << @command
      end
    end

    def display_results_of_command_group
      @results.each do |description, result|
        green @description
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