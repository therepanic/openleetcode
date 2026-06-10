class Solution {
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        var total = 0, tank = 0, start = 0
        for i in gas.indices {
            let diff = gas[i] - cost[i]
            total += diff
            tank += diff
            if tank < 0 { tank = 0; start = i + 1 }
        }
        return total < 0 ? -1 : start
    }
}
