module RedGreen
  RESET = "tput sgr0"
  
  def rainbow_puts color, message
    system color
    puts message
    system RESET
  end

  def green message
    rainbow_puts "tput setaf 2", message
  end
  
  def red message
    rainbow_puts "tput setaf 1", message
  end
end