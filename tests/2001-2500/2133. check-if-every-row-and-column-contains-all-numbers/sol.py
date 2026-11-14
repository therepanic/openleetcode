class Solution:
    def checkValid(self, matrix):
        n = len(matrix)
        for i in range(n):
            for j in range(n):
                pos = abs(matrix[i][j]) - 1
                if matrix[i][pos] < 0:
                    return False
                matrix[i][pos] = -matrix[i][pos]
        
        for j in range(n):
            for i in range(n):
                pos = abs(matrix[i][j]) - 1
                if matrix[pos][j] > 0:
                    return False
                matrix[pos][j] = abs(matrix[pos][j])
        
        return True