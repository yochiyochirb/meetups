puts Dir.pwd
Dir.chdir("/Users/yucao24hours/work/yochiyochi/meetups/reports")
puts Dir.pwd

Dir.entries(Dir.pwd).each do |entry|
  year = entry[0..3]
  month = entry[4..5]
  day = entry[6..7]
	puts year
  puts month
  puts day
end

