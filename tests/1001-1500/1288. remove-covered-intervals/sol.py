class Solution:
    def removeCoveredIntervals(self, A: List[List[int]]) -> int:
        A.sort(key=lambda x: (x[0], -x[1]))
        res = r = 0

        for st, end in A:
            res += end > r
            r = max(r, end)

        return res
