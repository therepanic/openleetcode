class Solution {
    func minimumXORSum(_ nums1: [Int], _ nums2: [Int]) -> Int {
        let n = nums1.count
        let fullMask = 1 << n
        var dp = [Int](repeating: 2147483647, count: fullMask)
        dp[0] = 0
        for mask in 0..<fullMask {
            let idx = mask.nonzeroBitCount
            if idx >= n { continue }
            for j in 0..<n {
                if (mask & (1 << j)) == 0 {
                    let nextMask = mask | (1 << j)
                    let cost = dp[mask] + (nums1[idx] ^ nums2[j])
                    if cost < dp[nextMask] {
                        dp[nextMask] = cost
                    }
                }
            }
        }
        return dp[fullMask - 1]
    }
}
