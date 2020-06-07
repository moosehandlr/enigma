require './test/test_helper'
require'./lib/enigma'

class EnigmaTest < Minitest::Test

  def test_it_exists
    enigma = Enigma.new
    assert_instance_of Enigma, enigma
  end

  def test_it_can_encrypt_message_with_given_key_and_date
    enigma = Enigma.new
    expected = {encryption: "keder ohulw", key: "02715", date: "040895"}
    assert_equal expected, enigma.encrypt("HELLO WORLD", "02715", "040895")
  end

  def test_it_can_decrypt_ciphertext_with_given_key_and_date
    enigma = Enigma.new
    expected = {decryption: "hello world", key: "02715", date: "040895"}
    assert_equal expected, enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_it_can_encrypt_message_with_key_and_todays_date
    enigma = Enigma.new
    encrypted = enigma.encrypt("hello world", "02715")
    expected = {encryption: "nib udmcxpu", key: "02715", date: "070620"}
    assert_equal expected, encrypted
  end

  def test_it_can_decrypt_message_with_key_and_todays_date
    enigma = Enigma.new
    encrypted = enigma.encrypt("hello world", "02715")
    expected = {decryption: "hello world", key: "02715", date: "070620"}
    assert_equal expected ,enigma.decrypt(encrypted[:encryption], "02715")
  end

  def test_it_can_encrypt_message_with_random_key_and_todays_date
    enigma = Enigma.new
    assert hash, enigma.encrypt("hello world")
  end

end
