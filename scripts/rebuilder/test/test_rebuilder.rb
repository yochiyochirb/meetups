require "minitest/autorun"
require_relative "../rebuilder.rb"

class TestRebuilder < Minitest::Test
  def setup
    @rebuilder = Rebuilder.new
  end

  def test_dest_dir
    #TODO: srcのディレクトリを渡すと新しいディレクトリ名が返ってくるdest_dirを作成
    src_dir = "20140722_no28"
    dest = "../"
    assert_equal @rebuilder.dest_dir(src_dir), dest
  end
end
