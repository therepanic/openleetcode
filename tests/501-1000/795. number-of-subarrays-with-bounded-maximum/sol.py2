class Solution(object):
    def numSubarrayBoundedMax(self, nums, left, right):
        """
        :type nums: List[int]
        :type left: int
        :type right: int
        :rtype: int
        """
        res, dp = 0, 0
        prev = -1
        for i in range(len(nums)):
            if nums[i] < left and i > 0:
                res += dp
            if nums[i] > right:
                dp = 0
                prev = i
            if left <= nums[i] <= right:
                dp = i - prev
                res += dp
        return res
