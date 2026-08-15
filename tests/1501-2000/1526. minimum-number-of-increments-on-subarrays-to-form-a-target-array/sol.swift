class Solution {
    func minNumberOperations(_ target: [Int]) -> Int {
        var total = target[0]
        for i in 1..<target.count {
            if target[i] > target[i - 1] {
                total += target[i] - target[i - 1]
            }
        }
        return total
    }
}
