# @param {String} s1
# @param {Integer} n1
# @param {String} s2
# @param {Integer} n2
# @return {Integer}
def get_max_repetitions(s1, n1, s2, n2)
  m = s1.length
  n = s2.length
  
  return 0 if m * n1 < n * n2
  
  j = 0
  cnt = 0
  k = 0
  
  seen = {}
  
  while k < n1
    s1.each_char do |ch|
      if ch == s2[j]
        j += 1
        if j == n
          cnt += 1
          j = 0
        end
      end
    end
    
    k += 1
    
    if seen.key?(j)
      prev_cnt, prev_k = seen[j]
      period_k = k - prev_k
      period_cnt = cnt - prev_cnt
      
      if period_cnt == 0
        break
      end
      
      remaining = n1 - k
      cycles = remaining / period_k
      
      cnt += cycles * period_cnt
      k += cycles * period_k
    else
      seen[j] = [cnt, k]
    end
  end
  
  cnt / n2
end
