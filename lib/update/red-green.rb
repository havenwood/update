module RedGreen
  GREEN = "tput setaf 2"
  RED   = "tput setaf 1"
  RESET = "tput sgr0"
  
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