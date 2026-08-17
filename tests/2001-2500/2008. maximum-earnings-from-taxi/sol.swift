class Solution {
    func maxTaxiEarnings(_ n: Int, _ rides: [[Int]]) -> Int {
        let sortedRides = rides.sorted { $0[1] < $1[1] }
        var dp: [(end: Int, profit: Int)] = [(0, 0)]
        
        for ride in sortedRides {
            let start = ride[0], end = ride[1], tip = ride[2]
            
            var lo = 0
            var hi = dp.count
            while lo < hi {
                let mid = lo + (hi - lo) / 2
                if dp[mid].end <= start {
                    lo = mid + 1
                } else {
                    hi = mid
                }
            }
            let i = lo - 1
            let profit = dp[i].profit + end - start + tip
            
            if profit > dp.last!.profit {
                dp.append((end, profit))
            }
        }
        
        return dp.last!.profit
    }
}
