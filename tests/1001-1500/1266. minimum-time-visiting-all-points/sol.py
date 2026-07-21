from typing import List


class Solution:
    def minTimeToVisitAllPoints(self, p: List[List[int]]) -> int:
        Ans = 0
        for i in range(1, len(p)):
            Ans += max(abs(p[i][0] - p[i - 1][0]), abs(p[i][1] - p[i - 1][1]))
        return Ans
