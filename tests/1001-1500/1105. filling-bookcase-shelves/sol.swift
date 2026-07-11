class Solution {
    func minHeightShelves(_ books: [[Int]], _ shelfWidth: Int) -> Int {
        let n = books.count
        var dp = [Int](repeating: Int.max, count: n + 1)
        dp[0] = 0
        
        for i in 1...n {
            dp[i] = dp[i - 1] + books[i - 1][1]
            var height = 0
            var width = 0
            for j in stride(from: i - 1, through: 0, by: -1) {
                height = max(books[j][1], height)
                width += books[j][0]
                if width > shelfWidth {
                    break
                }
                dp[i] = min(dp[i], dp[j] + height)
            }
        }
        
        return dp[n]
    }
}
