module RedGreen
  RED, GREEN, RESET = "tput setaf 1", "tput setaf 2", "tput sgr0"
  
  def green message
    system GREEN
    puts message
    system RESET
  end

  def red message
    system RED
    puts message
    system RESET
  end
end