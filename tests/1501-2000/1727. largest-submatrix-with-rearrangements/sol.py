# Added using AI
class Solution:
    def largestSubmatrix(self, matrix: list[list[int]]) -> int:
        m, n = len(matrix), len(matrix[0])
        maxArea = 0
        h = [0] * n

        for i in range(m):
            for j in range(n):
                if j < len(matrix[i]) and matrix[i][j] == 1:
                    h[j] += 1
                else:
                    h[j] = 0
            sh = sorted(h, reverse=True)
            for j in range(n):
                if sh[j] == 0:
                    break
                maxArea = max(maxArea, sh[j] * (j + 1))

        return maxArea
