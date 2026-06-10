def title_to_number(column_title)
  ans = 0
  column_title.each_byte do |ch|
    ans = ans * 26 + ch - 64
  end
  ans
end
