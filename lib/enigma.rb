class Enigma
  attr_reader :keys, :offsets, :shifts, :alphabet, :encryption
 def initialize
   @keys = Hash.new
   @offsets = Hash.new
   @shifts = Hash.new
   @alphabet = ("a".."z").to_a << " "
   @encryption = Hash.new
 end

 def gen_keys(num)
   # random = 5.times.map{rand(0..9)}
   random = num.split(//)
   key_nums = random.each_cons(2).to_a
   @keys[:a_key] = key_nums[0].join.to_i
   @keys[:b_key] = key_nums[1].join.to_i
   @keys[:c_key] = key_nums[2].join.to_i
   @keys[:d_key] = key_nums[3].join.to_i
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

 end

end
