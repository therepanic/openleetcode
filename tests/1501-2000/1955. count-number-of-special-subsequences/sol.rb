# @param {Integer[]} nums
# @return {Integer}
def count_special_subsequences(nums)
    mod = 10**9 + 7
    dp0 = dp1 = dp2 = 0
    nums.each do |x|
        if x == 0
            dp0 = (2 * dp0 + 1) % mod
        elsif x == 1
            dp1 = (2 * dp1 + dp0) % mod
        else
            dp2 = (2 * dp2 + dp1) % mod
        end
    end
    dp2
end
