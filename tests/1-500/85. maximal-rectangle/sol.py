class Solution:
    def maximalRectangle(self, matrix):
        if not matrix or not matrix[0]:
            return 0

        M = len(matrix)
        N = len(matrix[0])

        # Convert characters to integers
        for i in range(M):
            for j in range(N):
                matrix[i][j] = int(matrix[i][j])

        # Row-wise prefix widths
        for i in range(M):
            for j in range(1, N):
                if matrix[i][j] == 1:
                    matrix[i][j] += matrix[i][j - 1]

        Ans = 0

        # Fix each column
        for j in range(N):
            for i in range(M):
                width = matrix[i][j]
                if width == 0:
                    continue

                # Expand downward
                currWidth = width
                k = i
                while k < M and matrix[k][j] > 0:
                    currWidth = min(currWidth, matrix[k][j])
                    height = k - i + 1
                    Ans = max(Ans, currWidth * height)
                    k += 1

                # Expand upward
                currWidth = width
                k = i
                while k >= 0 and matrix[k][j] > 0:
                    currWidth = min(currWidth, matrix[k][j])
                    height = i - k + 1
                    Ans = max(Ans, currWidth * height)
                    k -= 1

        return Ans
