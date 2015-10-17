require "minitest/autorun"

class TestChangeDirectory < Minitest::Test
  def setup
    @change_directory = ChangeDirectory.new
  end
end
