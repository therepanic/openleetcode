class Solution:
    def minHeightShelves(self, books: list[list[int]], shelfWidth: int) -> int:
        n = len(books)
        dp = [float("infinity")] * (n + 1)
        dp[0] = 0

        for i in range(1, n + 1):
            dp[i] = dp[i - 1] + books[i - 1][1]
            height = 0
            width = 0
            for j in range(i - 1, -1, -1):
                height = max(books[j][1], height)
                width += books[j][0]
                if width > shelfWidth:
                    break
                dp[i] = min(dp[i], dp[j] + height)
        return dp[n]
