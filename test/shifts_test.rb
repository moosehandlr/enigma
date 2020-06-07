require './test/test_helper'
require './lib/shifts'

class ShiftsTest < Minitest::Test

  def test_it_exists
    shift = Shifts.new
    assert_instance_of Shifts, shift
  end
