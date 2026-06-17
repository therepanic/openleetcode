class Solution {
    func hIndex(_ citations: [Int]) -> Int {
        let sorted = citations.sorted(by: >)
        var count = 0
        for i in 0..<sorted.count {
            if sorted[i] >= i + 1 {
                count = i + 1
            } else {
                break
            }
        }
        return count
    }
}
