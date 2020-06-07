require './test/test_helper'
require './lib/keys'

class KeysTest < Minitest::Test

  def test_it_exists
    keys = Keys.new
    assert_instance_of Keys, keys
  end

  def test_it_can_generate_keys_with_argument
    keys = Keys.new
    assert_equal [["0","2"],["2","7"],["7","1"],["1","5"]],keys.gen_keys("02715")
  end

  def test_it_can_generate_random_keys
    keys = Keys.new
    assert_not_equal [["0","2"],["2","7"],["7","1"],["1","5"]],keys.gen_random
  end

end
