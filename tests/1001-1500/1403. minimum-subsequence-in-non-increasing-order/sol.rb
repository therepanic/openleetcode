# @param {Integer[]} nums
# @return {Integer[]}
def min_subsequence(nums)
    s = nums.sort
    v = []
    l = nums.length
    while v.sum <= s[0...l].sum
        l -= 1
        v << s[l]
    end
    v
end
