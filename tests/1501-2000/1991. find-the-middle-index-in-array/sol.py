class Solution:
    def findMiddleIndex(self, nums):

        total = sum(nums)

        leftSum = 0
        rightSum = total

        for i in range(len(nums)):
            rightSum -= nums[i]

            if leftSum == rightSum:
                return i

            leftSum += nums[i]

        return -1
