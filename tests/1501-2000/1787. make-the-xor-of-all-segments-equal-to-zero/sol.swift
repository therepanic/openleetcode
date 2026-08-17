class Solution {
    func minChanges(_ nums: [Int], _ k: Int) -> Int {
        var freq = [Int: [Int: Int]]()
        for (i, x) in nums.enumerated() {
            let rem = i % k
            freq[rem, default: [:]][x, default: 0] += 1
        }
        
        let n = 1 << 10
        var dp = Array(repeating: Int.min, count: n)
        dp[0] = 0
        for i in 0..<k {
            let mx = dp.max() ?? Int.min
            var tmp = Array(repeating: 0, count: n)
            for x in 0..<n {
                let c = dp[x]
                if let dict = freq[i] {
                    for (xx, cc) in dict {
                        let idx = x ^ xx
                        tmp[idx] = max(tmp[idx], c + cc, mx)
                    }
                }
            }
            dp = tmp
        }
        return nums.count - dp[0]
    }
}
