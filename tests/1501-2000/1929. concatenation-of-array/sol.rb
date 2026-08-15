# @param {Integer[]} nums
# @return {Integer[]}
def get_concatenation(nums)
    n = nums.length
    ans = Array.new(2 * n, 0)
    for i in 0...(2 * n)
        ans[i] = nums[i % n]
    end
    ans
end
