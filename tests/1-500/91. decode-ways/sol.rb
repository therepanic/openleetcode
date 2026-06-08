def num_decodings(s)
  return 0 if s.empty? || s[0] == '0'

  prev2 = 1
  prev1 = 1
  (1...s.length).each do |i|
    curr = 0
    curr += prev1 if s[i] != '0'
    value = s[i - 1, 2].to_i
    curr += prev2 if value >= 10 && value <= 26
    prev2 = prev1
    prev1 = curr
  end

  prev1
end
