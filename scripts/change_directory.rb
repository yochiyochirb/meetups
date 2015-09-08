require 'fileutils'

# original取得
originals = Dir.entries("C:/data/yochiyochi.rb/meetups-master/reports")
originals.shift(6)

originals.each do |original|
  # パス生成
  year = original[0..3]
  month = original[4..5]
  day = original[6..7]
  path_dst = "C:/data/yochiyochi.rb/new/" + year + "/" + month

  # ディレクトリ生成
  FileUtils.mkdir_p(path_dst)

  # データコピー
  path_src = "C:/data/yochiyochi.rb/meetups-master/reports/" + original
  path_dst = "C:/data/yochiyochi.rb/new/" + year + "/" + month + "/" + day
  FileUtils.cp_r(path_src, path_dst)

end
