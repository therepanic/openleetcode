class Solution:
    def maxEqualRowsAfterFlips(self, matrix):
        from collections import defaultdict

        count = defaultdict(int)
        ans = 0

        for row in matrix:
            flip = row[0]
            key = tuple(x ^ flip for x in row)
            count[key] += 1
            ans = max(ans, count[key])

        return ans
