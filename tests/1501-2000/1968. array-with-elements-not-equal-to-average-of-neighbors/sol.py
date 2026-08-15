class Solution(object):
    def rearrangeArray(self, nums):
        """
        :type nums: List[int]
        :rtype: List[int]
        """
        nums.sort()
        res = [0] * len(nums)
        mid = (len(nums) + 1) // 2
        res[::2] = nums[:mid]
        res[1::2] = nums[mid:]
        return res
