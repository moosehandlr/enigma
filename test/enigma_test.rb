require './test/test_helper'
require'./lib/enigma'

class EnigmaTest < Minitest::Test

  def test_it_exists
    enigma = Enigma.new
    assert_instance_of Enigma, enigma
  end

  def test_it_can_generate_keys
    enigma = Enigma.new
    enigma.gen_keys
    assert hash, enigma.keys
    p enigma.keys
  end

  def test_it_can_generate_date_offsets
    enigma = Enigma.new
    expected = {a_offset: 1, b_offset: 0, c_offset: 2, d_offset: 5}
    enigma.gen_offsets("040895")
    assert_equal expected, enigma.offsets
    p enigma.offsets
  end

end
