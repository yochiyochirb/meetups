require "minitest/autorun"
puts Dir.pwd
require_relative "change_directory"

class TestChangeDir < Minitest::Test
  def setup
    @change_dir = ::ChangeDir.new
  end

  def test_execute
    true
  end
end
