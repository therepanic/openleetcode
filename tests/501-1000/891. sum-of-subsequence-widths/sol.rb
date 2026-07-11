# @param {Integer[]} nums
# @return {Integer}
def sum_subseq_widths(nums)
    mod = 1000000007
    nums.sort!
    n = nums.length
    ans = 0
    factor = 1
    (0...n).each do |i|
        ans = (ans + (nums[i] - nums[~i]) * factor) % mod
        factor = (factor * 2) % mod
    end
    ans
end
