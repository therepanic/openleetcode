class Solution {
    fun minHeightShelves(books: Array<IntArray>, shelfWidth: Int): Int {
        val n = books.size
        val dp = IntArray(n + 1) { Int.MAX_VALUE / 4 }
        dp[0] = 0

        for (i in 1..n) {
            dp[i] = dp[i - 1] + books[i - 1][1]
            var height = 0
            var width = 0
            for (j in i - 1 downTo 0) {
                height = maxOf(height, books[j][1])
                width += books[j][0]
                if (width > shelfWidth) {
                    break
                }
                dp[i] = minOf(dp[i], dp[j] + height)
            }
        }

        return dp[n]
    }
}
