class Solution {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        var cost = cost
        cost.append(0)
        let n = cost.count
        for i in stride(from: n - 4, through: 0, by: -1) {
            cost[i] += min(cost[i+1], cost[i+2])
        }
        return min(cost[0], cost[1])
    }
}
