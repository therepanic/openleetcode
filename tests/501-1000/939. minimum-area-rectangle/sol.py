from typing import List


class Solution:
    def minAreaRect(self, points: List[List[int]]) -> int:
        cols = {}
        for x, y in points:
            cols.setdefault(x, []).append(y)

        last_x = {}
        best = float("inf")
        for x in sorted(cols):
            ys = sorted(cols[x])
            for i in range(len(ys)):
                for j in range(i + 1, len(ys)):
                    pair = (ys[i], ys[j])
                    if pair in last_x:
                        best = min(best, (x - last_x[pair]) * (ys[j] - ys[i]))
                    last_x[pair] = x
        return 0 if best == float("inf") else best
