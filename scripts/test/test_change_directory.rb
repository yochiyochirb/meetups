require "minitest/autorun"
require_relative "../change_directory.rb"

class TestChangeDirectory < Minitest::Test
  def setup
    @change_directory = ChangeDirectory.new
  end
end
