class Enigma
  attr_reader :keys
 def initialize
   @keys = Hash.new
   @offsets = Hash.new
 end

 def gen_keys
   random = 5.times.map{rand(0..9)}
   key_nums = random.each_cons(2).to_a
   @keys[:akey] = key_nums[0].join.to_i
   @keys[:bkey] = key_nums[1].join.to_i
   @keys[:ckey] = key_nums[2].join.to_i
   @keys[:dkey] = key_nums[3].join.to_i
 end

 def gen_offsets(date)

 end



end
