# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer}
def max_uncrossed_lines(nums1, nums2)
    m = nums1.length
    n = nums2.length
    dp = Array.new(m + 1) { Array.new(n + 1, 0) }
    (1..m).each do |i|
        (1..n).each do |j|
            if nums1[i - 1] == nums2[j - 1]
                dp[i][j] = 1 + dp[i - 1][j - 1]
            else
                dp[i][j] = [dp[i - 1][j], dp[i][j - 1]].max
            end
        end
    end
    dp[m][n]
end
