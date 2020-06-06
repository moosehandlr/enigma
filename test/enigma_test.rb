require './test/test_helper'
require'./lib/enigma'

class EnigmaTest < Minitest::Test

  def test_it_exists
    enigma = Enigma.new
    assert_instance_of Enigma, enigma
  end

  def test_it_can_create_keys
    expected = {"A Key" => 02,"B Key" => 27, "C Key" => 71, "D Key" => 15}
    assert_equal expected, enigma.keys
  end

end
