# @param {Integer} n
# @return {Integer[]}
def count_bits(n)
    dp = Array.new(n + 1, 0)
    sub = 1
    (1..n).each do |i|
        if sub * 2 == i
            sub = i
        end
        dp[i] = dp[i - sub] + 1
    end
    dp
end
