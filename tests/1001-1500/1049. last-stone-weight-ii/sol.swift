class Solution {
    func lastStoneWeightII(_ stones: [Int]) -> Int {
        let n = stones.count
        let total = stones.reduce(0, +)
        let target = total / 2
        var dp_prev = [Int](repeating: 0, count: target + 1)
        for i in stride(from: n - 1, through: 0, by: -1) {
            var dp_curr = [Int](repeating: 0, count: target + 1)
            for size in 0...target {
                let skip = dp_prev[size]
                let take: Int
                if size >= stones[i] {
                    take = dp_prev[size - stones[i]] + stones[i]
                } else {
                    take = Int.min
                }
                dp_curr[size] = max(skip, take)
            }
            dp_prev = dp_curr
        }
        return total - 2 * dp_prev[target]
    }
}
