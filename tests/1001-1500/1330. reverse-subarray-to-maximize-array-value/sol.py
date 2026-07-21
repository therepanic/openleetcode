from typing import List
from math import inf


class Solution:
    def maxValueAfterReverse(self, nums: List[int]) -> int:
        if len(nums) < 2:
            return 0

        maxMin = -inf
        minMin = inf
        S = 0
        boundary = -inf
        for a, b in zip(nums[:-1], nums[1:]):
            distance = abs(a - b)
            boundary = max(
                boundary, max(abs(nums[-1] - a), abs(nums[0] - b)) - distance
            )
            S += distance
            minMin = min(max(a, b), minMin)
            maxMin = max(min(a, b), maxMin)
        return S + max(2 * (maxMin - minMin), boundary)
