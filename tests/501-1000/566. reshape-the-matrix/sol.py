class Solution:
    def matrixReshape(self, mat: list[list[int]], r: int, c: int) -> list[list[int]]:
        m, n = len(mat), len(mat[0])
        if m * n != r * c:
            return mat

        reshaped = [[0] * c for _ in range(r)]
        count = 0

        for i in range(m):
            for j in range(n):
                reshaped[count // c][count % c] = mat[i][j]
                count += 1

        return reshaped
