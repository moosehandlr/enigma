require 'date'
require './lib/enigma'
require './lib/fileable'

include Fileable

message = reader(ARGV[0])

enigma = Enigma.new
message_encryption = enigma.encrypt(message)

cryption = message_encryption[:encryption]
key = message_encryption[:key]
date = message_encryption[:date]

writer(cryption, ARGV[1])

puts "Created 'encrypted.txt' with the key #{key} and date #{date}"
