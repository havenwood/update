class Update
  def parse_options
    options = Slop.parse(help: true, 
                         banner: "Usage: update [options]") do
      on :v, :version, "Print version information" do
        puts "Version #{Update::VERSION} on Ruby #{RUBY_VERSION}."
        puts "<shannonskipper@gmail.com>"
        exit
      end
      
      on :l, :list, "Print list of commands" do
        ap Update::COMMAND_GROUPS
        exit
      end

      on :e, :edit, "Edit list of commands" do
        puts "Edit the list of commands and descriptions. Usage:"
        puts
        puts "cd #{File.expand_path('../../update',__FILE__)}"
        puts
        puts "Then open 'commands.rb' with a text editor... and add your command and description to the list."
        puts "TODO: Better (read 'sane') way of doing this..."
        exit
      end
    end
  end
end