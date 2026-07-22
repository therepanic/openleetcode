from collections import defaultdict, deque


class BIT:
    def __init__(self, m):
        self.ans = [0] * (m + 1)

    def update(self, i, val):
        while i < len(self.ans):
            self.ans[i] += val
            i += i & -i

    def query(self, i):
        total = 0

        while i:
            total += self.ans[i]
            i -= i & -i

        return total


class Solution:
    def minInteger(self, num, k):
        n, dict1, res = len(num), defaultdict(deque), ""

        for i, x in enumerate(num):
            dict1[x].append(i)

        fenwick = BIT(n)

        for i in range(n):
            fenwick.update(i + 1, 1)

        for i in range(n):
            for v in "0123456789":
                if dict1[v]:
                    idx = dict1[v][0]
                    cnt = fenwick.query(idx)
                    if cnt <= k:
                        dict1[v].popleft()
                        k -= cnt
                        res += v
                        fenwick.update(idx + 1, -1)
                        break

        return res
