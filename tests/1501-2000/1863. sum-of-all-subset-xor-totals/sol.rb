# @param {Integer[]} nums
# @return {Integer}
def subset_xor_sum(nums)
    total = 0
    nums.each do |num|
        total |= num
    end
    total * (1 << (nums.length - 1))
end
