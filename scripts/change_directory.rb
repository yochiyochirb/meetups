puts Dir.pwd
Dir.chdir("/Users/yucao24hours/work/yochiyochi/meetups/reports")
puts Dir.pwd

Dir.entries(Dir.pwd).each do |entry|
	year = entry.str[0...4]
	month = entry.str[5.6]
	day = entry.str[7.8]
	puts year
end

