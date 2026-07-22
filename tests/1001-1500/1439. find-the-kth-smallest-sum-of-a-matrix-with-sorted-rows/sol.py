from typing import List


class Solution:
    def kthSmallest(self, mat: List[List[int]], k: int) -> int:
        sums = mat[0][:k]
        for row in mat[1:]:
            sums = sorted(a + b for a in sums for b in row[:k])[:k]
        return sums[k - 1]
