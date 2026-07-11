# @param {String} s
# @return {Integer}
def num_perms_di_sequence(s)
    n = s.length
    dp = [1]
    mod = 10**9 + 7
    (1..n).each do |i|
        prefix = Array.new(i + 1, 0)
        prefix[0] = dp[0]
        (1...i).each do |j|
            prefix[j] = (prefix[j-1] + dp[j]) % mod
        end
        prefix[i] = prefix[i-1] % mod
        ndp = Array.new(i + 1, 0)
        if s[i-1] == 'I'
            (0..i).each do |j|
                ndp[j] = j > 0 ? prefix[j-1] % mod : 0
            end
        else
            (0..i).each do |j|
                ndp[j] = (prefix[i-1] - (j > 0 ? prefix[j-1] : 0)) % mod
            end
        end
        dp = ndp
    end
    dp.sum % mod
end
