class Solution(object):
    def numberOfArithmeticSlices(self, nums):
        c = 0
        t = 2
        for i in range(1, len(nums) - 1):
            if nums[i - 1] - nums[i] == nums[i] - nums[i + 1]:
                t += 1
            else:
                t = 2
            c += t - 2
        return c
