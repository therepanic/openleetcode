def hamming_weight(n)
  value = n & 0xffffffff
  ans = 0
  32.times do
    ans += value & 1
    value >>= 1
  end
  ans
end
