# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def count_k_difference(nums, k)
    c = nums.tally
    c.sum { |x, cnt| cnt * (c[x + k] || 0) }
end
