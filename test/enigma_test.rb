require './test/test_helper'
require'./lib/enigma'

class EnigmaTest < Minitest::Test

  def test_it_exists
    enigma = Enigma.new
    assert_instance_of Enigma, enigma
  end

  def test_it_can_encrypt_message_and_return_hash
    enigma = Enigma.new
    expected = {encryption: "keder ohulw", key: "02715", date: "040895"}
    assert_equal expected, enigma.encrypt("HELLO WORLD", "02715", "040895")
  end

end
