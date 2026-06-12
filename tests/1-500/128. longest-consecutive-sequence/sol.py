from typing import List


class Solution:
    def longestConsecutive(self, nums: List[int]) -> int:
        seen = set(nums)
        best = 0
        for num in seen:
            if num - 1 in seen:
                continue
            current = num
            streak = 1
            while current + 1 in seen:
                current += 1
                streak += 1
            best = max(best, streak)
        return best
