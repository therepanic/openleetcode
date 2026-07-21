class Solution {
    private func cal(_ a: Int, _ b: Int) -> Int {
        return abs(a / 6 - b / 6) + abs(a % 6 - b % 6)
    }

    func minimumDistance(_ word: String) -> Int {
        let n = word.count
        let chars = Array(word)
        var dp = [Int](repeating: 0, count: 26)
        var ndp = [Int](repeating: 0, count: 26)

        for i in 1..<n {
            let p = Int(chars[i - 1].asciiValue! - 65)
            let t = Int(chars[i].asciiValue! - 65)

            for j in 0..<26 {
                ndp[j] = dp[j] + cal(p, t)
            }

            for j in 0..<26 {
                ndp[p] = min(ndp[p], dp[j] + cal(j, t))
            }

            (dp, ndp) = (ndp, dp)
        }

        return dp.min()!
    }
}
