# @param {String} s
# @param {Integer} k
# @return {Integer}
def number_of_arrays(s, k)
    mod = 1000000007
    n = s.length
    dp = Array.new(n + 1, 0)
    dp[0] = 1
    width = k.to_s.length
    (0...n).each do |i|
        next if s[i] == '0' || dp[i] == 0
        value = 0
        (i...[n, i + width].min).each do |j|
            value = value * 10 + s[j].ord - 48
            break if value > k
            dp[j + 1] = (dp[j + 1] + dp[i]) % mod
        end
    end
    dp[-1]
end
