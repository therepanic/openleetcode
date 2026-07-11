# @param {Integer} n
# @return {String}
def base_neg2(n)
  return '0' if n == 0
  res = []
  while n != 0
    digit = n & 1
    res << digit.to_s
    n = (n - digit) / -2
  end
  res.reverse.join
end
