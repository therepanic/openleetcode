# @param {Integer[]} nums
# @return {Integer[]}
def decompress_rl_elist(nums)
    a = []
    (0...nums.length).step(2) do |i|
        a.concat([nums[i + 1]] * nums[i])
    end
    a
end
