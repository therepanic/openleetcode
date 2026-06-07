class Solution(object):
    def maxSubArray(self, nums):
        best = nums[0]
        cur = 0
        for n in nums:
            if cur < 0:
                cur = 0
            cur += n
            if cur > best:
                best = cur
        return best
