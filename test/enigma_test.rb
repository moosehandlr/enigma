require './test/test_helper'
require'./lib/enigma'

class EnigmaTest < Minitest::Test

  def test_it_exists
    enigma = Enigma.new
    assert_instance_of Enigma, enigma
  end

  def test_it_can_generate_keys_from_given_num
    enigma = Enigma.new
    enigma.gen_keys("02715")
    expected = {a_key: 02, b_key: 27, c_key: 71, d_key: 15}
    assert_equal expected, enigma.keys
    p enigma.keys
  end

  def test_it_can_generate_date_offsets
    enigma = Enigma.new
    expected = {a_offset: 1, b_offset: 0, c_offset: 2, d_offset: 5}
    enigma.gen_offsets("040895")
    assert_equal expected, enigma.offsets
    p enigma.offsets
  end

  def test_it_can_generate_shifts
    enigma = Enigma.new
    enigma.gen_keys("02715")
    enigma.gen_offsets("040895")
    enigma.gen_shifts

    expected = {a_shift: 3, b_shift: 27, c_shift: 73, d_shift: 20}
    assert_equal expected, enigma.shifts
    p enigma.shifts
  end

  def test_it_can_encrypt_message
    enigma = Enigma.new
    enigma.encrypt("hello world", "02715", "040895")
    expected = {encryption: "keder ohulw", key: "02715", date: "040895"}
    assert_equal expected, enigma.encryption
  end

end
