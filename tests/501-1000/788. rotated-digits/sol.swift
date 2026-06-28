class Solution {
    func rotatedDigits(_ n: Int) -> Int {
        var dp = [Int](repeating: 0, count: n + 1)
        var count = 0

        for i in 0...n {
            if i < 10 {
                if i == 0 || i == 1 || i == 8 {
                    dp[i] = 1
                } else if i == 2 || i == 5 || i == 6 || i == 9 {
                    dp[i] = 2
                    count += 1
                } else {
                    dp[i] = 0
                }
            } else {
                let a = dp[i / 10]
                let b = dp[i % 10]

                if a == 1 && b == 1 {
                    dp[i] = 1
                } else if a >= 1 && b >= 1 {
                    dp[i] = 2
                    count += 1
                } else {
                    dp[i] = 0
                }
            }
        }

        return count
    }
}
