require 'date'
require './lib/enigma'
require './lib/fileable'

include Fileable

message = reader(ARGV[0])

enigma = Enigma.new
message_decryption = enigma.decrypt(message, ARGV[2], ARGV[3])

cryption = message_decryption[:decryption]
key = message_decryption[:key]
date = message_decryption[:date]

writer(cryption, ARGV[1])

puts "Created 'decrypted.txt' with the key #{key} and date #{date}"
