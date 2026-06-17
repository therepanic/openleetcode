from bisect import bisect_left
from sortedcontainers import SortedSet


class Solution:
    def maxSumSubmatrix(self, matrix, k):
        m, n = len(matrix), len(matrix[0])
        ans = float("-inf")

        # Ensure we iterate over the smaller dimension for efficiency
        for left in range(n):
            rowSum = [0] * m
            for right in range(left, n):
                for i in range(m):
                    rowSum[i] += matrix[i][right]

                s = SortedSet([0])
                curr = 0
                for x in rowSum:
                    curr += x
                    idx = bisect_left(s, curr - k)
                    if idx < len(s):
                        ans = max(ans, curr - s[idx])
                    s.add(curr)

        return ans
