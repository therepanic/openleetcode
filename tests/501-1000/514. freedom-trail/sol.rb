# @param {String} ring
# @param {String} key
# @return {Integer}
def find_rotate_steps(ring, key)
    dist = ->(size, p, t) { [(t - p).abs, size - (t - p).abs].min }
    
    mp = Array.new(26) { Array.new(100, 0) }
    freq = Array.new(26, 0)
    dp = Array.new(100) { Array.new(100, 0) }
    
    n, m = ring.length, key.length
    ring.each_char.with_index do |c, i|
        idx = c.ord - 'a'.ord
        mp[idx][freq[idx]] = i
        freq[idx] += 1
    end
    
    first_char = key[0].ord - 'a'.ord
    (0...freq[first_char]).each do |i|
        dp[0][mp[first_char][i]] = dist.call(n, 0, mp[first_char][i]) + 1
    end
    
    (1...m).each do |i|
        prev_char = key[i - 1].ord - 'a'.ord
        curr_char = key[i].ord - 'a'.ord
        (0...freq[curr_char]).each do |j|
            mini = Float::INFINITY
            (0...freq[prev_char]).each do |k|
                val = dp[i - 1][mp[prev_char][k]] + dist.call(n, mp[curr_char][j], mp[prev_char][k]) + 1
                mini = val if val < mini
            end
            dp[i][mp[curr_char][j]] = mini
        end
    end
    
    res = Float::INFINITY
    last_char = key[m - 1].ord - 'a'.ord
    (0...freq[last_char]).each do |i|
        res = dp[m - 1][mp[last_char][i]] if dp[m - 1][mp[last_char][i]] < res
    end
    
    res
end
