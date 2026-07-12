class Solution {
    func twoCitySchedCost(_ costs: [[Int]]) -> Int {
        var res = 0
        let sorted = costs.sorted { ($0[0] - $0[1]) < ($1[0] - $1[1]) }
        let n = sorted.count
        for i in 0..<n {
            if i < n / 2 {
                res += sorted[i][0]
            } else {
                res += sorted[i][1]
            }
        }
        return res
    }
}
