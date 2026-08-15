# @param {Integer[]} nums
# @return {Integer[]}
def build_array(nums)
    for i in 0...nums.length
        nums[i] += (1024 * (nums[nums[i]] % 1024))
    end
    
    for i in 0...nums.length
        nums[i] /= 1024
    end
    
    nums
end
