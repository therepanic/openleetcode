class Solution:
    def maximalSquare(self, matrix: List[List[str]]) -> int:
        Rows, Cols = len(matrix), len(matrix[0])
        max_area = 0

        for r in range(Rows - 1, -1, -1):
            for c in range(Cols - 1, -1, -1):
                if matrix[r][c] == "1":
                    down = int(matrix[r + 1][c]) if (r + 1) < Rows else 0
                    right = int(matrix[r][c + 1]) if (c + 1) < Cols else 0
                    diag = (
                        int(matrix[r + 1][c + 1])
                        if ((c + 1) < Cols and (r + 1) < Rows)
                        else 0
                    )

                    matrix[r][c] = 1 + min(down, right, diag)
                else:
                    matrix[r][c] = 0

                max_area = max(max_area, matrix[r][c])

        return max_area * max_area
