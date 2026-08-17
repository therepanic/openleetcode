from collections import defaultdict
from itertools import product


class Solution:
    def isPrintable(self, targetGrid: List[List[int]]) -> bool:

        def dp(color: int) -> bool:

            rows, cols = list(zip(*colors[color]))

            mn_r, mx_r, mn_c, mx_c = (
                min(rows),
                max(rows) + 1,
                min(cols),
                max(cols) + 1,
            )

            for i, j in product(range(mn_r, mx_r), range(mn_c, mx_c)):
                if targetGrid[i][j] != color and targetGrid[i][j] > 0:
                    return False

            for i in range(mn_r, mx_r):
                targetGrid[i][mn_c:mx_c] = [0] * (mx_c - mn_c)

            return True

        m, n = len(targetGrid), len(targetGrid[0])
        colors = defaultdict(list)

        for i, j in product(range(m), range(n)):
            colors[targetGrid[i][j]].append((i, j))

        color_set = set(colors)

        while color_set:
            tmp = set(filter(lambda x: dp(x), color_set))
            if not tmp:
                return False
            color_set -= tmp

        return True
