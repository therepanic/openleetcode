class Solution {
    func maxValue(_ events: [[Int]], _ k: Int) -> Int {
        let sortedEvents = events.sorted { $0[1] < $1[1] }
        let n = sortedEvents.count
        var dp = Array(repeating: Array(repeating: 0, count: k + 1), count: n + 1)
        
        for i in 1...n {
            let start = sortedEvents[i - 1][0]
            let value = sortedEvents[i - 1][2]
            let prev = findLastNonOverlapping(sortedEvents, i - 1, start)
            for j in 1...k {
                dp[i][j] = max(dp[i - 1][j], dp[prev + 1][j - 1] + value)
            }
        }
        return dp[n][k]
    }
    
    private func findLastNonOverlapping(_ events: [[Int]], _ right: Int, _ targetStart: Int) -> Int {
        var left = 0
        var res = -1
        var r = right
        while left <= r {
            let mid = (left + r) / 2
            if events[mid][1] < targetStart {
                res = mid
                left = mid + 1
            } else {
                r = mid - 1
            }
        }
        return res
    }
}
