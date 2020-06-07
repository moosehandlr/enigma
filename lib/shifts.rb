require './lib/keys'
require './lib/offsets'

class Shifts

  def self.gen_shifts(key, date)
    shifts = {}
    keys = Keys.gen_keys(key)
    offsets = Offsets.gen_offsets(date)
    shift_vals = keys.values.zip(offsets.values)
    shifts[:a_shift] = shift_vals[0].sum
    shifts[:b_shift] = shift_vals[1].sum
    shifts[:c_shift] = shift_vals[2].sum
    shifts[:d_shift] = shift_vals[3].sum
    shifts
  end
end
