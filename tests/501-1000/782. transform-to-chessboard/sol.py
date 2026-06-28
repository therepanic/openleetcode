from math import inf
from typing import List


class Solution:
    def movesToChessboard(self, board: List[List[int]]) -> int:
        n = len(board)

        def fn(vals):
            """Return min moves to transform to chessboard."""
            total = odd = 0
            for i, x in enumerate(vals):
                if vals[0] == x:
                    total += 1
                    if i & 1:
                        odd += 1
                elif vals[0] ^ x != (1 << n) - 1:
                    return inf
            ans = inf
            if len(vals) <= 2 * total <= len(vals) + 1:
                ans = min(ans, odd)
            if len(vals) - 1 <= 2 * total <= len(vals):
                ans = min(ans, total - odd)
            return ans

        rows, cols = [0] * n, [0] * n
        for i in range(n):
            for j in range(n):
                if board[i][j]:
                    rows[i] ^= 1 << j
                    cols[j] ^= 1 << i
        ans = fn(rows) + fn(cols)
        return ans if ans < inf else -1
