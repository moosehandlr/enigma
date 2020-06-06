class Enigma
  attr_reader :keys, :offsets
 def initialize
   @keys = Hash.new
   @offsets = Hash.new
 end

 def gen_keys
   random = 5.times.map{rand(0..9)}
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



end
