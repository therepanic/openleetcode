class Solution:
    def rob(self, nums):

        next1 = 0
        next2 = 0

        for i in range(len(nums) - 1, -1, -1):
            curr = max(nums[i] + next2, next1)

            next2 = next1
            next1 = curr

        return next1
