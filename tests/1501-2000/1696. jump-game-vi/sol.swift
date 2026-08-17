class Solution {
    func maxResult(_ nums: [Int], _ k: Int) -> Int {
        let n = nums.count
        var dp = [Int](repeating: 0, count: n)
        dp[0] = nums[0]
        var dq = [0]
        var head = 0
        for i in 1..<n {
            if dq[head] < i - k {
                head += 1
            }
            dp[i] = nums[i] + dp[dq[head]]
            while dq.count > head && dp[dq[dq.count - 1]] <= dp[i] {
                dq.removeLast()
            }
            dq.append(i)
        }
        return dp[n - 1]
    }
}
