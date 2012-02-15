module RedGreen
  def red text
    say "tput setaf 1", text
  end
  
  def green text
    say "tput setaf 2", text
  end

  def say color, text
    system color
    puts text
    system "tput sgr0" #default color
  end
end