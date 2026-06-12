def convert_to_title(column_number)
  chars = []
  while column_number > 0
    column_number -= 1
    chars << (65 + column_number % 26).chr
    column_number /= 26
  end
  chars.reverse.join
end
