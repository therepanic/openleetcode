def reverse_bits(n)
  value = n & 0xffffffff
  ans = 0
  32.times do
    ans = (ans << 1) | (value & 1)
    value >>= 1
  end
  ans
end
