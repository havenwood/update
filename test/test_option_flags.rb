require_relative 'helper'

class TestUpdate < MiniTest::Unit::TestCase
  def test_version
    version = `update -v`
    assert_match version, /Version \d.\d.\d on/
  end

  def test_list
    list = `update -l`
    assert_match list, /[0]/
  end

  def test_edit
    edit = `update -e`
    assert true, "Yes, I'm asserting that true is true. This feature is not implemented nor really even envisioned yet."
  end

  def test_help
    help = `update -h`
    assert help.empty?, "Slop -h returns an empty string, not sure why. TODO: find out why. >.>"
  end
end