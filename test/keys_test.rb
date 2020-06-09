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

  def test_it_can_generate_string_of_random_keys
    assert "string", Keys.gen_random
  end

  def test_it_can_buffer_with_zeros
    expected = {a_key: 0, b_key: 0, c_key: 3, d_key: 31}
    assert_equal expected, Keys.gen_keys("31")

    expected = {a_key: 0, b_key: 1, c_key: 12, d_key: 23}
    assert_equal expected, Keys.gen_keys("123")
  end
end
