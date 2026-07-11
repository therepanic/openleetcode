class Solution:
    def maxScoreSightseeingPair(self, values: List[int]) -> int:
        n = len(values)
        suffixMax = [0] * n
        suffixMax[n - 1] = values[n - 1] - (n - 1)

        for i in range(n - 2, -1, -1):
            suffixMax[i] = max(suffixMax[i + 1], values[i] - i)

        maxScore = float("-inf")

        for i in range(n - 1):
            maxScore = max(maxScore, values[i] + i + suffixMax[i + 1])

        return maxScore
