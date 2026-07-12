# @param {String} s
# @return {Integer}
def distinct_subseq_ii(s)
    n = s.length
    dp = Array.new(n, 0)
    dp[0] = 2
    mp = {}
    mp[s[0]] = 0
    mod = 10**9 + 7
    (1...n).each do |i|
        dp[i] = 2 * dp[i-1]
        if mp.key?(s[i])
            dp[i] -= mp[s[i]] > 0 ? dp[mp[s[i]]-1] : 1
        end
        mp[s[i]] = i
        dp[i] %= mod
    end
    (dp[-1] - 1 + mod) % mod
end
