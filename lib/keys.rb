class Keys
  def initialize

  end

  def gen_keys(key)
    key.split(//).each_cons(2).to_a
  end

    # key_nums = random.
    # @keys[:a_key] = key_nums[0].join.to_i
    # @keys[:b_key] = key_nums[1].join.to_i
    # @keys[:c_key] = key_nums[2].join.to_i
    # @keys[:d_key] = key_nums[3].join.to_i

end
