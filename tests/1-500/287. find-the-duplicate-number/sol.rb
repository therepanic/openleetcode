# @param {Integer[]} nums
# @return {Integer}
def find_duplicate(nums)
    slow = nums[0]
    fast = nums[nums[0]]
    while slow != fast
        slow = nums[slow]
        fast = nums[nums[fast]]
    end
    
    slow = 0
    while slow != fast
        slow = nums[slow]
        fast = nums[fast]
    end
    return fast
end
