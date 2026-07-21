# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer}
def max_dot_product(nums1, nums2)
    negative_infinity = -Float::INFINITY
    dp = Array.new(nums2.length + 1, negative_infinity)

    nums1.each do |value1|
        previous_diagonal = negative_infinity
        1.upto(nums2.length) do |j|
            previous_row = dp[j]
            product = value1 * nums2[j - 1]
            left = dp[j - 1]

            best = product
            best = [best, previous_diagonal + product].max unless previous_diagonal == negative_infinity
            best = [best, previous_row, left].max
            dp[j] = best
            previous_diagonal = previous_row
        end
    end

    dp[nums2.length]
end
