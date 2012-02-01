module Update
  COMMANDS = {
    "brew update" => "Checking for updated Brew packages...",
    "brew upgrade" => "Installing updated Brew packages...",
    "brew cleanup --force" => "Cleaning up outdated packages...",
      
    ##
    # Create additional command-groups by uncommenting the following-ish:
    
    # "ls -la" => "Look around...",
    # "uname -a" => "Whatchamacallit...",

    "rvm get head --auto" => "Get the latest RVM...",
    "rvm 1.9.3-head do gem update --system" => "Update 1.9.3's RubyGems version...",
    "rvm 1.9.3-head do gem update" => "Update 1.9.3 gems...",
    "rvm 1.9.3-head do gem cleanup -d" => "Show 1.9.3 gem cleanup dry-run...",
    "rvm rbx-head do gem update --system" => "Update Rubinius' RubyGems version...",
    "rvm rbx-head do gem update" => "Update Rubinius gems...",
    "rvm rbx-head do gem cleanup -d" => "Show Rubinius gem cleanup dry-run..." }
end