class Solution:
    def pathInZigZagTree(self, label):
        res = []
        cur = label
        while cur > 0:
            res.append(cur)
            start = 1
            while start * 2 <= cur:
                start *= 2
            end = start * 2 - 1
            cur = (start + end - cur) // 2
        return res[::-1]
