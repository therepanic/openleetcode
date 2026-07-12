from typing import List


class Solution:
    def largestSumAfterKNegations(self, nums: List[int], k: int) -> int:
        nums = sorted(nums)
        for i in range(len(nums)):
            if nums[i] < 0 and k > 0:
                nums[i] = -nums[i]
                k -= 1
        nums = sorted(nums)
        if k > 0 and k % 2 != 0:
            nums[0] = -nums[0]
        return sum(nums)
