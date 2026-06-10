def min_cut(s)
  n = s.length
  is_pal = Array.new(n) { Array.new(n, false) }
  (0...n).each do |ending|
    (0..ending).each do |starting|
      if s[starting] == s[ending] && (ending - starting <= 2 || is_pal[starting + 1][ending - 1])
        is_pal[starting][ending] = true
      end
    end
  end
  dp = Array.new(n, 0)
  (0...n).each do |i|
    if is_pal[0][i]
      dp[i] = 0
    else
      dp[i] = i
      (0...i).each do |j|
        dp[i] = [dp[i], dp[j] + 1].min if is_pal[j + 1][i]
      end
    end
  end
  dp[-1]
end
