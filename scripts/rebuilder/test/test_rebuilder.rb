require "minitest/autorun"
require_relative "../rebuilder.rb"

class TestRebuilder < Minitest::Test
  def setup
    @rebuilder = Rebuilder.new
  end

  def test_dest_dir
    src_dir = "20140722_no28"
    # XXX 各自の環境に依存している
    dest = "/Users/yucao24hours/work/yochiyochi/meetups/attendees/2014/07/22"
    assert_equal @rebuilder.dest_dir(src_dir), dest
  end

  def test_copy_dir
    expected = !File.directory?("/Users/yucao24hours/work/yochiyochi/meetups/attendees/2014/07/22")

    assert expected
  end
end
