require 'fileutils'
# TODO attendees ディレクトリがすでに存在する場合は以下の処理を飛ばしたい

class Rebuilder
  def dest_dir(str)
    year = str[0..3]
    month = str[4..5]
    day = str[6..7]
    "#{meetups}/attendees/#{year}/#{month}/#{day}"
  end

  def run_rebuilder
    # reportsディレクトリに移動
    Dir.chdir('reports')

    # reportsディレクトリ内のディレクトリを全て取得
    dirs = Dir.glob('*')

    # 各ディレクトリを対象にする（dir)
    dirs.each do |dir|
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

  private

  def meetups
    Dir.chdir(File.dirname(__FILE__))
    Dir.chdir("../../")

    Dir.pwd
  end
end
