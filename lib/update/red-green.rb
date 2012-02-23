module RedGreen
	private
	
	def red text
		system "tput setaf 1"
		STDERR.puts text
		system "tput sgr0" #default color
	end
	
	def green text
		system "tput setaf 2"
		puts text
		system "tput sgr0" #default color
	end
end