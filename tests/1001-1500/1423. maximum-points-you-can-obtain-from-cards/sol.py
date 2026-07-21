class Solution(object):
    def maxScore(self, cp, k):
        l = 0
        total = sum(cp[len(cp) - k :])
        res = total
        for r in range(len(cp) - k, len(cp)):
            total += cp[l] - cp[r]
            res = max(res, total)
            l += 1
        return res
