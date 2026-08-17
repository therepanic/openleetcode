class Solution:
    def maxMatrixSum(self, matrix: list[list[int]]) -> int:
        totalSum = 0
        neg = 0
        minAbs = float("inf")

        for row in matrix:
            for v in row:
                if v < 0:
                    neg += 1
                av = abs(v)
                totalSum += av
                minAbs = min(minAbs, av)

        return totalSum if neg % 2 == 0 else totalSum - 2 * minAbs
