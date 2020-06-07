require './test/test_helper'
require './lib/shifts'

class ShiftsTest < Minitest::Test

  def test_it_exists
    shift = Shifts.new
    assert_instance_of Shifts, shift
  end

  def test_it_can_generate_shift_with_given_key_and_date
    expected = {a_shift: 3, b_shift: 27, c_shift: 73, d_shift: 20}
    assert_equal expected, Shifts.gen_shifts("02715", "040895")
  end
end
