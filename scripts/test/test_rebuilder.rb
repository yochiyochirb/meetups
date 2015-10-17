require "minitest/autorun"
require_relative "../rebuilder.rb"

class TestRebuilder < Minitest::Test
  def setup
    @rebuilder = Rebuilder.new
  end
end
