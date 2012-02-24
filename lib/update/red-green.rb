module RedGreen
  private
  
  def red text
    system "tput setaf 1" #red text
    STDERR.puts text
    system "tput sgr0" #default text
  end
  
  def green text
    system "tput setaf 2" #green text
    puts text
    system "tput sgr0" #default text
  end
end