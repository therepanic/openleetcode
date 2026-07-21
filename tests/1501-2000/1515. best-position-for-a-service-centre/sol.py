from math import sqrt
from typing import List


class Solution:
    def getMinDistSum(self, positions: List[List[int]]) -> float:
        # euclidean distance
        fn = lambda x, y: sum(
            sqrt((x - xx) ** 2 + (y - yy) ** 2) for xx, yy in positions
        )
        # centroid as starting point
        x = sum(x for x, _ in positions) / len(positions)
        y = sum(y for _, y in positions) / len(positions)

        ans = fn(x, y)
        chg = 100  # change since 0 <= positions[i][0], positions[i][1] <= 100
        while chg > 1e-6:  # accuracy within 1e-5
            zoom = True
            for dx, dy in (-1, 0), (0, -1), (0, 1), (1, 0):
                xx = x + chg * dx
                yy = y + chg * dy
                dd = fn(xx, yy)
                if dd < ans:
                    ans = dd
                    x, y = xx, yy
                    zoom = False
                    break
            if zoom:
                chg /= 2
        return ans
