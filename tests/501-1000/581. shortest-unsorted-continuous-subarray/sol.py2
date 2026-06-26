class Solution(object):
    def findUnsortedSubarray(self, nums):
        sorted_nums = sorted(nums)
        start, end = len(nums), 0

        for i in range(len(nums)):
            if nums[i] != sorted_nums[i]:
                start = min(start, i)
                end = max(end, i)

        return end - start + 1 if end - start >= 0 else 0
