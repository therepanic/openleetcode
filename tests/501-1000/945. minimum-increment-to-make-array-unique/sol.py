from typing import List


class Solution:
    def minIncrementForUnique(self, nums: List[int]) -> int:
        n = len(nums)
        nums.sort()
        res = 0
        for i in range(n):
            if i > 0 and nums[i] <= nums[i - 1]:
                target = nums[i - 1] + 1
                res += target - nums[i]
                nums[i] = target
        return res
