puts Dir.pwd
Dir.chdir("./reports")
puts Dir.pwd

Dir.entries(Dir.pwd).each do |entry|
	puts "entry:#{entry}"
	if entry != "." || entry != ".."
		p year = entry[0..3]
		p month = entry[4..5]
		p day = entry[6..7]
		p path = year + "/" + month + "/" + day
	end
puts path
  #Dir.mkdir(year)
end
