class Keys
  def initialize
  end

  def gen_keys(key)
    keys = {}
    paired_keys = key.split(//).each_cons(2).to_a
    keys[:a_key] = paired_keys[0].join.to_i
    keys[:b_key] = paired_keys[1].join.to_i
    keys[:c_key] = paired_keys[2].join.to_i
    keys[:d_key] = paired_keys[3].join.to_i
    keys
  end

  def gen_random
    keys = {}
    paired_keys = 5.times.map{rand(0..9)}.each_cons(2).to_a
    keys[:a_key] = paired_keys[0].join.to_i
    keys[:b_key] = paired_keys[1].join.to_i
    keys[:c_key] = paired_keys[2].join.to_i
    keys[:d_key] = paired_keys[3].join.to_i
    keys
  end

  def hash_render

  end
end
