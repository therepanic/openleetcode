from typing import List


class Solution:
    def lengthOfLIS(self, nums: List[int]) -> int:
        prev_idx: int = -1
        dp: list[list[int]] = [[-1] * 2500 for _ in range(0, 2500)]
        return self.helper(0, prev_idx, nums, dp)

    def helper(
        self, i: int, prev_idx: int, nums: list[int], dp: list[list[int]]
    ) -> int:
        if i >= len(nums):
            return 0

        if dp[i][prev_idx] != -1:
            return dp[i][prev_idx]

        steal: int = 0
        skip: int = 0

        if prev_idx == -1 or nums[prev_idx] < nums[i]:
            steal = 1 + self.helper(i + 1, i, nums, dp)

        skip = self.helper(i + 1, prev_idx, nums, dp)

        dp[i][prev_idx] = max(steal, skip)
        return max(steal, skip)
