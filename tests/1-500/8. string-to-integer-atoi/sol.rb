def my_atoi(s)
  s = s.strip
  return 0 if s.empty?

  sign = 1
  i = 0
  if s[0] == '-'
    sign = -1
    i += 1
  elsif s[0] == '+'
    i += 1
  end

  res = 0
  while i < s.length && s[i] >= '0' && s[i] <= '9'
    digit = s[i].ord - 48
    if sign == 1
      return 2147483647 if res > 214748364 || (res == 214748364 && digit > 7)
    else
      return -2147483648 if res > 214748364 || (res == 214748364 && digit > 8)
    end
    res = res * 10 + digit
    i += 1
  end

  sign * res
end
