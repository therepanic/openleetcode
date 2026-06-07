class Solution(object):
    def solveNQueens(self, n):
        res = []
        board = [['.'] * n for _ in range(n)]
        cols = [False] * n
        diag1 = [False] * (2 * n)
        diag2 = [False] * (2 * n)

        def backtrack(row):
            if row == n:
                res.append([''.join(r) for r in board])
                return
            for col in range(n):
                d1 = row + col
                d2 = row - col + n - 1
                if cols[col] or diag1[d1] or diag2[d2]:
                    continue
                cols[col] = diag1[d1] = diag2[d2] = True
                board[row][col] = 'Q'
                backtrack(row + 1)
                board[row][col] = '.'
                cols[col] = diag1[d1] = diag2[d2] = False

        backtrack(0)
        return res
