module Update
  COMMAND_GROUPS = [
    {
      "brew update"          => "Checking for updated Brew packages...",
      "brew upgrade"         => "Installing updated Brew packages...",
      "brew cleanup --force" => "Cleaning up outdated packages..."
    },

	  {
	    "rvm get head --auto"  => "Getting the latest RVM..."
	  },
    
    { 
      "gem update --system"  => "Getting the latest RubyGems...",
      "gem update"           => "Updating gems...",
      "gem cleanup --dryrun" => "Showing gem cleanup dry-run..."
    }
  ]
end