# Update: a gem to run a list of updates
Update is a simple Ruby script for running sets of updates from your command line.
##Installation and usage
```ruby
gem install update
update
```
Running `update` processes the list of updates found in the commands.rb file and then reports back whether the updates were run sucessfully.
##Edit list of updates
Modify the Hash of update commands in commands.rb to customize update scripts. TODO: Sane and usable way to do this. >.>
##Usage
Usage: update [options]

options:

    -v, --version      Print version information
    -l, --list         Print list of commands
    -e, --edit         Edit list of commands
    -h, --help         Print this help message
##License
Copyright (c) Shannon Skipper.
MIT License.