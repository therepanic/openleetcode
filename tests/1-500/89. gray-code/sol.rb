def gray_code(n)
  total = 1 << n
  res = []
  total.times { |i| res << (i ^ (i >> 1)) }
  res
end
