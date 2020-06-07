require 'date'
require './lib/keys'
require './lib/offsets'
require './lib/shifts'

class Enigma
  attr_reader :alphabet
 def initialize
   @alphabet = ("a".."z").to_a << " "
 end

 def encrypt(message, key, date)
   shifts = Shifts.gen_shifts(key, date)
   encryption = {}
   encrypted_message = []

   parse_message = message.chars.each_slice(4).to_a
   parse_message.each do |group|
     Hash[group.map.with_index {|x, i| [i, x]}].each do |k,v|
       if k == 0
         encrypted_message << @alphabet.rotate(shifts[:a_shift])[@alphabet.index(group[0].downcase)]
       elsif k == 1
         encrypted_message << @alphabet.rotate(shifts[:b_shift])[@alphabet.index(group[1].downcase)]
       elsif k == 2
         encrypted_message << @alphabet.rotate(shifts[:c_shift])[@alphabet.index(group[2].downcase)]
       elsif k == 3
         encrypted_message << @alphabet.rotate(shifts[:d_shift])[@alphabet.index(group[3].downcase)]
       end
     end
   end
   encryption[:encryption] = encrypted_message.join
   encryption[:key] = key
   encryption[:date] = date
   encryption
 end

 def decrypt(ciphertext, key, date)
   shifts = Shifts.gen_shifts(key, date)
   decryption = {}
   decrypted_message = []

   parse_ciphertext = ciphertext.chars.each_slice(4).to_a
   parse_ciphertext.each do |group|
     Hash[group.map.with_index {|x, i| [i, x]}].each do |k,v|
       if k == 0
         decrypted_message << @alphabet.rotate(shifts[:a_shift]*-1)[@alphabet.index(group[0].downcase)]
       elsif k == 1
         decrypted_message << @alphabet.rotate(shifts[:b_shift]*-1)[@alphabet.index(group[1].downcase)]
       elsif k == 2
         decrypted_message << @alphabet.rotate(shifts[:c_shift]*-1)[@alphabet.index(group[2].downcase)]
       elsif k == 3
         decrypted_message << @alphabet.rotate(shifts[:d_shift]*-1)[@alphabet.index(group[3].downcase)]
       end
     end
   end
   decryption[:decryption] = decrypted_message.join
   decryption[:key] = key
   decryption[:date] = date
   decryption
 end

end
