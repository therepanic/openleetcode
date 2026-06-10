def find_repeated_dna_sequences(s)
  seen = Hash.new(0)
  ans = []
  0.upto(s.length - 10) do |i|
    sub = s[i, 10]
    ans << sub if seen[sub] == 1
    seen[sub] += 1
  end
  ans
end
