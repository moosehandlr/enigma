module Fileable
  def reader(file_loc)
    file = File.open(file_loc, "r")
    message = file.read.strip
  end

  def writer(cryption, file_loc)
    write_file = File.open(file_loc, "w")
    write_file.write(cryption)
    write_file.close
  end
end
