from typing import List


class Solution:
    def maxWidthRamp(self, nums: List[int]) -> int:
        n = len(nums)
        right_max = [0] * n

        right_max[-1] = nums[-1]

        for i in range(n - 2, -1, -1):
            right_max[i] = max(nums[i], right_max[i + 1])

        i = 0
        j = 0
        result = 0
        while j < n:
            if nums[i] <= right_max[j]:
                result = max(result, j - i)
                j += 1
            else:
                i += 1

        return result
