require "minitest/autorun"
require_relative "../rebuilder.rb"

class TestRebuilder < Minitest::Test
  def setup
    @rebuilder = Rebuilder.new
  end

  def test_run_rebuilder
    @rebuilder.run_rebuilder
  end

  def test_i_am_at_reports
    
  end

  def test_katorie
    
  end


end
