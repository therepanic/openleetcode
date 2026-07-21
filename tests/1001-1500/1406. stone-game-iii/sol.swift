class Solution {
    func stoneGameIII(_ stoneValue: [Int]) -> String {
        let n = stoneValue.count
        var dp = [0, 0, 0]

        for i in stride(from: n - 1, through: 0, by: -1) {
            let takeOne = stoneValue[i] - dp[(i + 1) % 3]

            var takeTwo = Int.min
            if i + 1 < n {
                takeTwo = stoneValue[i] + stoneValue[i + 1] - dp[(i + 2) % 3]
            }

            var takeThree = Int.min
            if i + 2 < n {
                takeThree = stoneValue[i] + stoneValue[i + 1] + stoneValue[i + 2] - dp[(i + 3) % 3]
            }

            dp[i % 3] = max(takeOne, max(takeTwo, takeThree))
        }

        let value = dp[0]
        if value > 0 {
            return "Alice"
        } else if value < 0 {
            return "Bob"
        } else {
            return "Tie"
        }
    }
}
