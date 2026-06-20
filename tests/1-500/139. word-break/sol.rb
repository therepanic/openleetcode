def word_break(s, word_dict)
  words = word_dict.to_set
  max_len = word_dict.map(&:length).max || 0
  n = s.length
  dp = Array.new(n + 1, false)
  dp[n] = true
  (n - 1).downto(0) do |i|
    1.upto(max_len) do |len|
      break if i + len > n
      if words.include?(s[i, len]) && dp[i + len]
        dp[i] = true
        break
      end
    end
  end
  dp[0]
end
