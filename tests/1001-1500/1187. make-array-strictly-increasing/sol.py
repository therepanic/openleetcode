from bisect import bisect_right
from functools import cache
from sys import maxsize
from typing import List


class Solution:
    def makeArrayIncreasing(self, first: List[int], second: List[int]) -> int:
        @cache
        def dp(i: int, prev_max: int) -> int:
            if i == len(first):
                return 0

            j = bisect_right(second, prev_max)

            return min(
                dp(i + 1, first[i]) if first[i] > prev_max else maxsize,
                dp(i + 1, second[j]) + 1 if j < len(second) else maxsize,
            )

        second.sort()
        operations = dp(0, -maxsize)
        return operations if operations != maxsize else -1
