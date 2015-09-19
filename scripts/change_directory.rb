puts Dir.pwd
Dir.chdir("./reports")
puts Dir.pwd

Dir.entries(Dir.pwd).each do |entry|
	puts entry
	if entry != "." || entry != ".."
		year = entry[0..3]
		month = entry[4..5]
		day = entry[6..7]
		path = year + "/" + month + "/" + day
	end
puts path
  #Dir.mkdir(year)
end
