class Solution {
    func mincostTickets(_ days: [Int], _ costs: [Int]) -> Int {
        let n = days.count
        var left7 = 0
        var left30 = 0
        var dp = Array(repeating: 0, count: n)
        
        for right in 0..<n {
            while days[right] - days[left7] >= 7 {
                left7 += 1
            }
            while days[right] - days[left30] >= 30 {
                left30 += 1
            }
            
            let cost1 = (right > 0 ? dp[right - 1] : 0) + costs[0]
            let cost7 = (left7 > 0 ? dp[left7 - 1] : 0) + costs[1]
            let cost30 = (left30 > 0 ? dp[left30 - 1] : 0) + costs[2]
            
            dp[right] = min(cost1, min(cost7, cost30))
        }
        
        return dp[n - 1]
    }
}
