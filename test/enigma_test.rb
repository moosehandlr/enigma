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
    expected = {aoffset: 1, boffset: 0, coffset: 2, doffset: 5}
    assert_equal expected, enigma.offsets(040895)
  end

end
