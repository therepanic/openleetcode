from itertools import product
from typing import List


class Solution:
    def allCellsDistOrder(
        self, rows: int, cols: int, rCenter: int, cCenter: int
    ) -> List[List[int]]:
        cells = sorted(
            product(range(rows), range(cols)),
            key=lambda p: (abs(p[0] - rCenter) + abs(p[1] - cCenter), p[0], p[1]),
        )
        return [[r, c] for r, c in cells]
