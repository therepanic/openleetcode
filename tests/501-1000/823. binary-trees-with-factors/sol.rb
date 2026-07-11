# @param {Integer[]} arr
# @return {Integer}
def num_factored_binary_trees(arr)
    mod = 10**9 + 7
    arr.sort!
    dp = {}
    s = arr.to_set
    arr.each do |x|
        dp[x] = 1
        arr.each do |a|
            break if a > x
            if x % a == 0
                b = x / a
                if s.include?(b)
                    dp[x] = (dp[x] + dp[a] * dp[b]) % mod
                end
            end
        end
    end
    dp.values.sum % mod
end
