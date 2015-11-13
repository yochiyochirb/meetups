require 'fileutils'
# TODO attendees ディレクトリがすでに存在する場合は以下の処理を飛ばしたい

class Rebuilder
  def dest_dir(str)
  end

  def run_rebuilder
    # reportsディレクトリに移動
    Dir.chdir('reports')

    # reportsディレクトリ内のディレクトリを全て取得
    dirs = Dir.glob('*')

    # 各ディレクトリを対象にする（dir)
    dirs.each do |dir|
      # TODO: ここの処理をdest_dirに突っ込んで分割する予定
      # # 既存のフォルダ名を分解する
      # year = dir[0..3]
      # month = dir[4..5]
      # day = dir[6..7]

      # # attendeesフォルダを作成し、年月日ごとのフォルダを作成
      # dest = "../attendees/#{year}/#{month}/#{day}/"
      dest = dest_dir(dir)
      FileUtils.mkdir_p(dest)

      # 既存のフォルダに移動する
      Dir.chdir(dir)

      # フォルダにあるすべてのファイルのファイル名を配列で取得する
      files = Dir.glob("*")

      dest2 = '../' + dest
      puts dest2
      FileUtils.cp(files, dest2)

      # reportsのフォルダに移動する
      Dir.chdir('..')
    end
  end
end
