class Solution(object):
    def totalNQueens(self, n):
        count = [0]
        cols = [False] * n
        diag1 = [False] * (2 * n)
        diag2 = [False] * (2 * n)

        def backtrack(row):
            if row == n:
                count[0] += 1
                return
            for col in range(n):
                d1 = row + col
                d2 = row - col + n - 1
                if cols[col] or diag1[d1] or diag2[d2]:
                    continue
                cols[col] = diag1[d1] = diag2[d2] = True
                backtrack(row + 1)
                cols[col] = diag1[d1] = diag2[d2] = False

        backtrack(0)
        return count[0]
