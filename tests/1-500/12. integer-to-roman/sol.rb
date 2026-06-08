def int_to_roman(num)
  m = ['', 'M', 'MM', 'MMM']
  c = ['', 'C', 'CC', 'CCC', 'CD', 'D', 'DC', 'DCC', 'DCCC', 'CM']
  x = ['', 'X', 'XX', 'XXX', 'XL', 'L', 'LX', 'LXX', 'LXXX', 'XC']
  i = ['', 'I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX']
  m[num / 1000] + c[(num % 1000) / 100] + x[(num % 100) / 10] + i[num % 10]
end
