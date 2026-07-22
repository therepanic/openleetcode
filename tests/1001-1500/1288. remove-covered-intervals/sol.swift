class Solution {
    func removeCoveredIntervals(_ intervals: [[Int]]) -> Int {
        let sorted = intervals.sorted { a, b in
            a[0] == b[0] ? a[1] > b[1] : a[0] < b[0]
        }
        var res = 0, r = 0
        for interval in sorted {
            if interval[1] > r {
                res += 1
            }
            r = max(r, interval[1])
        }
        return res
    }
}
