require "minitest/autorun"
require_relative "../rebuilder.rb"

class TestRebuilder < Minitest::Test
  def setup
    @rebuilder = Rebuilder.new
  end

  def test_dest_dir
    src_dir = "20140722_no28"
    dest = "attendees/2014/07/22"

    assert_equal @rebuilder.dest_dir(src_dir), dest
  end
end
