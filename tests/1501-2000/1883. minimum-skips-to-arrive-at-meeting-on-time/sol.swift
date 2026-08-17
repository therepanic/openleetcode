class Solution {
    func minSkips(_ dist: [Int], _ speed: Int, _ hoursBefore: Int) -> Int {
        let inf = Int(1e18)
        let n = dist.count
        var dp = [Int](repeating: inf, count: n + 1)
        dp[0] = 0
        for i in 0..<n {
            var nxt = [Int](repeating: inf, count: n + 1)
            let d = dist[i]
            for skips in 0...(i + 1) {
                if dp[skips] >= inf { continue }
                nxt[skips + 1] = min(nxt[skips + 1], dp[skips] + d)
                var arrival = dp[skips] + d
                if i != n - 1 {
                    arrival = ((arrival + speed - 1) / speed) * speed
                }
                nxt[skips] = min(nxt[skips], arrival)
            }
            dp = nxt
        }
        let limit = hoursBefore * speed
        for (skips, arrival) in dp.enumerated() {
            if arrival <= limit { return skips }
        }
        return -1
    }
}
