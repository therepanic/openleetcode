def min_distance(word1, word2)
  dp = (0..word2.length).to_a

  (1..word1.length).each do |i|
    prev = dp[0]
    dp[0] = i
    (1..word2.length).each do |j|
      temp = dp[j]
      if word1.getbyte(i - 1) == word2.getbyte(j - 1)
        dp[j] = prev
      else
        dp[j] = 1 + [prev, dp[j], dp[j - 1]].min
      end
      prev = temp
    end
  end

  dp[-1]
end
