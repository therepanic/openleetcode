# @param {Integer} n
# @param {Integer} k
# @return {Integer}
def rearrange_sticks(n, k)
    mod = 1000000007
    dp = Array.new(k + 1, 0)
    dp[0] = 1
    (1..n).each do |length|
        nxt = Array.new(k + 1, 0)
        (1..[length, k].min).each do |visible|
            nxt[visible] = (dp[visible - 1] + (length - 1) * dp[visible]) % mod
        end
        dp = nxt
    end
    dp[k]
end
