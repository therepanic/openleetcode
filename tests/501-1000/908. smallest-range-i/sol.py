class Solution(object):
    def smallestRangeI(self, nums, k):
        # Find the current boundaries of the array
        min_val = nums[0]
        max_val = nums[0]

        for val in nums:
            if val < min_val:
                min_val = val
            elif val > max_val:
                max_val = val

        # The goal is to minimize (max_val - k) - (min_val + k)
        # This simplifies to max_val - min_val - 2*k
        # If the gap is already small (<= 2*k), the minimum range is 0
        return max(0, max_val - min_val - k * 2)
