module RedGreen
  def green message
    system "tput setaf 2" #color green
    puts message
    system "tput sgr0" #color reset
  end

  def red message
    system "tput setaf 1" #color red
    puts message
    system "tput sgr0" #color reset
  end
end