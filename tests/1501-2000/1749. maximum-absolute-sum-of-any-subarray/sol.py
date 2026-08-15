class Solution:
    def maxAbsoluteSum(self, nums):
        prefix_sum = 0
        min_prefix_sum = 0
        max_prefix_sum = 0
        max_absolute_sum = 0

        for num in nums:
            prefix_sum += num  # Update prefix sum

            # Update max_absolute_sum
            max_absolute_sum = max(max_absolute_sum, abs(prefix_sum - min_prefix_sum))
            max_absolute_sum = max(max_absolute_sum, abs(prefix_sum - max_prefix_sum))

            # Update min_prefix_sum and max_prefix_sum
            min_prefix_sum = min(min_prefix_sum, prefix_sum)
            max_prefix_sum = max(max_prefix_sum, prefix_sum)

        return max_absolute_sum
