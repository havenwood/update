module Rainbow
  def default text
    rainbow "tput sgr0", text
  end

  def green text
    rainbow "tput setaf 2", text
  end
  
  def red text
    rainbow "tput setaf 1", text
  end
  
  private

  def rainbow color, text
    system color
    puts text
    system "tput sgr0" #set text color back to default
  end
end