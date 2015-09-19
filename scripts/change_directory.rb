require 'fileutils'
# TODO attendees ディレクトリがすでに存在する場合は以下の処理を飛ばしたい

Dir.chdir('reports')

dirs = Dir.glob('*')
dirs.each do |dir|
  Dir.chdir('reports')
  year = dir[0..3]
  month = dir[4..5]
  day = dir[6..7]
  FileUtils.mkdir_p("../attendees/#{year}/#{month}/#{day}/")

  # NOTE コピー元ファイルの中にディレクトリ名が入っている
  Dir.chdir(dir)
  p Dir.glob("*")
  files = Dir.glob("*")
  #FileUtils.cp(files, dest)
  Dir.chdir('..')

end
