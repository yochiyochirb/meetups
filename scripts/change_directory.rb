require 'fileutils'
# TODO attendees ディレクトリがすでに存在する場合は以下の処理を飛ばしたい

Dir.chdir('reports')

dirs = Dir.glob('*')
dirs.each do |dir|
  year = dir[0..3]
  month = dir[4..5]
  day = dir[6..7]
  dest = "../attendees/#{year}/#{month}/#{day}/"
  FileUtils.mkdir_p(dest)

  Dir.chdir(dir)
  files = Dir.glob("*")
  #FileUtils.cp(files, dest)
  Dir.chdir('..')

end
