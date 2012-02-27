module Update
  COMMAND_GROUPS = [
    {"brew update"          => "Checking for updated Brew packages...",
     "brew upgrade"         => "Installing updated Brew packages...",
     "brew cleanup --force" => "Cleaning up outdated packages..."},
    {"rvm get head --auto"  => "Get the latest RVM..."},
    {"gem update --system"  => "Get the latest RubyGems...",
     "gem update"           => "Update gems...",
     "gem cleanup --dryrun" => "Show gem cleanup dry-run..."}
  ]
end