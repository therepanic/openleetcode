from functools import cache
from typing import List


class Solution:
    def largestNumber(self, cost: List[int], target: int) -> str:
        N = len(cost)
        s = ""

        @cache
        def helper(i, c):
            if c == 0:
                return 0
            if i == N or c < 0:
                return -float("inf")
            return max(helper(i + 1, c), 1 + helper(i, c - cost[i]))

        e = helper(0, target)
        if e == -float("inf"):
            return "0"
        for i in range(e):
            for j in reversed(range(1, 10)):
                if (
                    cost[j - 1] <= target
                    and helper(0, target - cost[j - 1]) == e - i - 1
                ):
                    target -= cost[j - 1]
                    s += str(j)
        return s
