class Solution:
    def pivotIndex(self, nums):

        totalSum = sum(nums)

        lSum = 0
        rSum = totalSum

        for i in range(len(nums)):
            rSum -= nums[i]

            if lSum == rSum:
                return i

            lSum += nums[i]

        return -1
