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
      Update::COMMANDS.each do |command_group|
        command_group.each do |run_together|
          @run_together = run_together
          Thread.new do
            @run_together.each do |command, description|
              @command = command
              green description
              puts `#{command}`
              check_for_failures
            end
          end
        end
      end
    end
    
    def check_for_failures
      unless $?.success?
        @failed ||= []
        @failed << @command
        red "Command failed: '#{@command}'"
      end
    end
    
    def report_status
      if @failed
        red "Update process completed with failures.\a" #chirp
        @failed.each { |this_failed| puts "Command failed: '#{this_failed}'" }
      else
        green "Update process completed successfully."
      end
    end
  end
end