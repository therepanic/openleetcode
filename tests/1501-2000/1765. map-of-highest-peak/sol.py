class Solution:
    def highestPeak(self, isWater: List[List[int]]) -> List[List[int]]:
        R = len(isWater)
        C = len(isWater[0])
        height = [[float("inf")] * C for _ in range(R)]

        for i in range(R):
            for j in range(C):
                if isWater[i][j] == 1:
                    height[i][j] = 0
                else:
                    if i > 0:
                        height[i][j] = min(height[i][j], height[i - 1][j] + 1)
                    if j > 0:
                        height[i][j] = min(height[i][j], height[i][j - 1] + 1)

        for i in range(R - 1, -1, -1):
            for j in range(C - 1, -1, -1):
                if i < R - 1:
                    height[i][j] = min(height[i][j], height[i + 1][j] + 1)
                if j < C - 1:
                    height[i][j] = min(height[i][j], height[i][j + 1] + 1)

        return height
