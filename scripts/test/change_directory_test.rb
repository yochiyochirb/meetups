require "minitest/autorun"

class TestChangeDir < Minitest::Test
  def setup
    @change_dir = ChangeDir.new
  end
end
