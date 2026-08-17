class Solution {
    func maximumScore(_ nums: [Int], _ multipliers: [Int]) -> Int {
        let m = multipliers.count
        var dp = [[Int?]](repeating: [Int?](repeating: nil, count: m + 1), count: m + 1)
        
        func f(_ i: Int, _ j: Int) -> Int {
            let k = i + j
            if k == m { return 0 }
            if let val = dp[i][j] { return val }
            
            let back = multipliers[k] * nums[nums.count - 1 - j] + f(i, j + 1)
            let front = multipliers[k] * nums[i] + f(i + 1, j)
            let result = max(front, back)
            dp[i][j] = result
            return result
        }
        
        return f(0, 0)
    }
}
