from typing import List


class Solution(object):
    def kWeakestRows(self, mat, k):
        d = {}
        n = len(mat)
        for i in range(n):
            d[i] = sum(mat[i])
        return sorted(d, key=d.get)[:k]
