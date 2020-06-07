require './test/test_helper'
require './lib/offsets'

class OffsetsTest < Minitest::Test

  def test_it_exists
    offset = Offsets.new
    assert_instance_of Offsets, offset
  end

  def test_it_can_generate_offsets_with_given_date
    offset = Offsets.new
    expected = {a_offset: 1, b_offset: 0, c_offset: 2, d_offset: 5}
    assert_equal expected, offset.gen_offsets("040895")
  end

  def test_it_can_generate_offsets_with_todays_date
    offset = Offsets.new
    expected = {a_offset: 4, b_offset: 4, c_offset: 0, d_offset: 0}
    assert_equal expected, offset.gen_today
  end

end
