from typing import List

from collections import defaultdict
from math import gcd


class Solution:
    def maxPoints(self, points: List[List[int]]) -> int:
        n = len(points)
        if n <= 2:
            return n

        best = 0
        for i in range(n):
            slopes = defaultdict(int)
            duplicates = 1
            local_best = 0
            x1, y1 = points[i]
            for j in range(i + 1, n):
                x2, y2 = points[j]
                dx = x2 - x1
                dy = y2 - y1
                if dx == 0 and dy == 0:
                    duplicates += 1
                    continue
                g = gcd(dx, dy)
                dx //= g
                dy //= g
                if dx < 0:
                    dx = -dx
                    dy = -dy
                elif dx == 0:
                    dy = 1
                elif dy == 0:
                    dx = 1
                slopes[(dx, dy)] += 1
                local_best = max(local_best, slopes[(dx, dy)])
            best = max(best, local_best + duplicates)
        return best
