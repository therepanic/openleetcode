def divide(dividend, divisor)
  return 2**31 - 1 if dividend == -(2**31) && divisor == -1

  ans = (dividend.to_f / divisor.to_f).truncate
  [[ans, -(2**31)].max, 2**31 - 1].min
end
