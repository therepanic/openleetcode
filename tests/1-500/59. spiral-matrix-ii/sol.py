class Solution:
    def generateMatrix(self, n):
        x, y, dx, dy = 0, 0, 1, 0
        res = [[0 for _ in range(n)] for _ in range(n)]

        for i in range(n * n):
            res[y][x] = i + 1

            if not 0 <= x + dx < n or not 0 <= y + dy < n or res[y+dy][x+dx] != 0:
                dx, dy = -dy, dx
            
            x += dx
            y += dy

        return res
