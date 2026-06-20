class Solution {
    func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
        if intervals.isEmpty { return 0 }
        let sorted = intervals.sorted { $0[1] < $1[1] }
        var count = 0
        var end = sorted[0][1]
        for i in 1..<sorted.count {
            if end > sorted[i][0] {
                count += 1
            } else {
                end = sorted[i][1]
            }
        }
        return count
    }
}
