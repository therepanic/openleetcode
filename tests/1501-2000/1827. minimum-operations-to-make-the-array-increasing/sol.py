class Solution(object):
    def minOperations(self, nums):
        c = nums[0]
        s = 0
        for i in range(1, len(nums)):
            if nums[i] > c:
                c = nums[i]
            else:
                c += 1
                s += abs(c - nums[i])
        return s
