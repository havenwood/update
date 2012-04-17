require_relative 'async'

class Update
  include RedGreen

  def run
    Update::COMMAND_GROUPS.each do |commands|
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
      
    report_final_status
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