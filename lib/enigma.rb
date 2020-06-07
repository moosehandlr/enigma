require 'date'

class Enigma
  attr_reader :keys, :offsets, :shifts, :alphabet, :encryption
 def initialize
   @keys = Hash.new
   @offsets = Hash.new
   @shifts = Hash.new
   @alphabet = ("a".."z").to_a << " "
   @encryption = Hash.new
 end

 
 def gen_offsets(date)
   date_squared = date.to_i**2
   offset_nums = date_squared.to_s.split(//).last(4)
   @offsets[:a_offset] = offset_nums[0].to_i
   @offsets[:b_offset] = offset_nums[1].to_i
   @offsets[:c_offset] = offset_nums[2].to_i
   @offsets[:d_offset] = offset_nums[3].to_i
 end

 def gen_shifts
   shift_vals = @keys.values.zip(@offsets.values)
   @shifts[:a_shift] = shift_vals[0].sum
   @shifts[:b_shift] = shift_vals[1].sum
   @shifts[:c_shift] = shift_vals[2].sum
   @shifts[:d_shift] = shift_vals[3].sum
 end

 def encrypt(message, key, date)
   encrypted_message = []
   split_message = message.chars.each_slice(4).to_a
   split_message.each do |split|
     Hash[split.map.with_index { |x, i| [i, x] }].each do |k,v|
       if k == 0
         encrypted_message << @alphabet.rotate(@shifts[:a_shift])[@alphabet.index(split[0].downcase)]
       elsif k == 1
         encrypted_message << @alphabet.rotate(@shifts[:b_shift])[@alphabet.index(split[1].downcase)]
       elsif k == 2
         encrypted_message << @alphabet.rotate(@shifts[:c_shift])[@alphabet.index(split[2].downcase)]
       elsif k == 3
         encrypted_message << @alphabet.rotate(@shifts[:d_shift])[@alphabet.index(split[3].downcase)]
       end
     end
   end

   @encryption[:encryption] = encrypted_message.join
   @encryption[:key] = key
   @encryption[:date] = date
 end

end
