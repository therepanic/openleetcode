class Solution {
    func maxProfit(_ k: Int, _ prices: [Int]) -> Int {
        let n = prices.count
        if k == 0 || n < 2 { return 0 }
        if k >= n / 2 {
            var ans = 0
            for i in 1..<n where prices[i] > prices[i - 1] {
                ans += prices[i] - prices[i - 1]
            }
            return ans
        }

        var hold = Array(repeating: Int.min / 4, count: k + 1)
        var free = Array(repeating: 0, count: k + 1)
        for price in prices {
            for t in 1...k {
                hold[t] = max(hold[t], free[t - 1] - price)
                free[t] = max(free[t], hold[t] + price)
            }
        }
        return free.max() ?? 0
    }
}
