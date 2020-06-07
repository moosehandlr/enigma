require 'date'
class Offsets
#Consider refactpr converting hashes to arrays
  def self.gen_offsets(date)
    offsets = {}
    date_squared = date.to_i**2
    offset_nums = date_squared.to_s.split(//).last(4)
    offsets[:a_offset] = offset_nums[0].to_i
    offsets[:b_offset] = offset_nums[1].to_i
    offsets[:c_offset] = offset_nums[2].to_i
    offsets[:d_offset] = offset_nums[3].to_i
    offsets
  end

  def self.gen_today
    todays_date =  Date.today.strftime("%d%m%Y").chars
    todays_date.delete_at(4)
    todays_date.delete_at(4)
    todays_date.join
  end
end
