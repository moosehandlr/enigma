require './test/test_helper'
require './lib/keys'

class KeysTest < Minitest::Test

  def test_it_exists
    key = Keys.new
    assert_instance_of Keys, key
  end

  def test_it_can_generate_keys_with_given_key
    expected = {a_key: 02, b_key: 27, c_key: 71, d_key: 15}
    assert_equal expected, Keys.gen_keys("02715")
  end

  def test_it_can_generate_random_keys
    skip
    expected = {a_key: 71, b_key: 03, c_key: 16, d_key: 22}
    assert_equal expected, Keys.gen_random
  end
end
