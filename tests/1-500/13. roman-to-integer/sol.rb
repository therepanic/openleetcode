def roman_to_int(s)
  roman = {'I' => 1, 'V' => 5, 'X' => 10, 'L' => 50, 'C' => 100, 'D' => 500, 'M' => 1000}
  res = 0
  chars = s.chars
  chars.each_cons(2) do |a, b|
    if roman[a] < roman[b]
      res -= roman[a]
    else
      res += roman[a]
    end
  end
  res + roman[chars[-1]]
end
