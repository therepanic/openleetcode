def reverse(x)
  sign = x < 0 ? -1 : 1
  num = x.abs
  res = 0

  while num > 0
    res = res * 10 + (num % 10)
    num /= 10
  end

  res *= sign
  return 0 if res < -2147483648 || res > 2147483647

  res
end
