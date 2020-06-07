require './test/test_helper'
require'./lib/enigma'

class EnigmaTest < Minitest::Test

  def test_it_exists
    enigma = Enigma.new
    assert_instance_of Enigma, enigma
  end

  def test_it_can_generate_shifts
    enigma = Enigma.new
    enigma.gen_keys("02715")
    enigma.gen_offsets("040895")
    enigma.gen_shifts

    expected = {a_shift: 3, b_shift: 27, c_shift: 73, d_shift: 20}
    assert_equal expected, enigma.shifts
  end

  def test_it_can_encrypt_message
    enigma = Enigma.new
    enigma.gen_keys("02715")
    enigma.gen_offsets("040895")
    enigma.gen_shifts
    enigma.encrypt("HELLO WORLD", "02715", "040895")

    expected = {encryption: "keder ohulw", key: "02715", date: "040895"}
    assert_equal expected, enigma.encryption
  end

end
