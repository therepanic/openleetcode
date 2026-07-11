class Solution {
    func largeGroupPositions(_ s: String) -> [[Int]] {
        var intervals: [[Int]] = []
        let chars = Array(s)
        var left = 0
        while left < chars.count {
            let start = left
            while left + 1 < chars.count && chars[left + 1] == chars[left] {
                left += 1
            }
            if left - start >= 2 {
                intervals.append([start, left])
            }
            left += 1
        }
        return intervals
    }
}
