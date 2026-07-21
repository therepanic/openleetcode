class Solution {
    func jobScheduling(_ startTime: [Int], _ endTime: [Int], _ profit: [Int]) -> Int {
        let n = startTime.count
        var jobs = [(Int, Int, Int)]()
        for i in 0..<n {
            jobs.append((startTime[i], endTime[i], profit[i]))
        }
        jobs.sort { $0.0 < $1.0 }
        
        let starts = jobs.map { $0.0 }
        var dp = [Int](repeating: 0, count: n + 1)
        
        func binarySearch(_ target: Int, _ from: Int) -> Int {
            var lo = from, hi = n
            while lo < hi {
                let mid = lo + (hi - lo) / 2
                if starts[mid] >= target {
                    hi = mid
                } else {
                    lo = mid + 1
                }
            }
            return lo
        }
        
        for i in stride(from: n - 1, through: 0, by: -1) {
            let idx = binarySearch(jobs[i].1, i + 1)
            let take = jobs[i].2 + dp[idx]
            let notTake = dp[i + 1]
            dp[i] = max(take, notTake)
        }
        return dp[0]
    }
}
