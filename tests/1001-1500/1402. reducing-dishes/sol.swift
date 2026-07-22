class Solution {
    func maxSatisfaction(_ satisfaction: [Int]) -> Int {
        var satisfaction = satisfaction.sorted(by: >)
        var presum = 0, res = 0
        for s in satisfaction {
            presum += s
            if presum < 0 { break }
            res += presum
        }
        return res
    }
}
