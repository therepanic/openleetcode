class Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        var res = [[Int]]()
        var i = 0
        var current = newInterval

        while i < intervals.count && intervals[i][1] < current[0] {
            res.append(intervals[i])
            i += 1
        }

        while i < intervals.count && intervals[i][0] <= current[1] {
            current[0] = min(current[0], intervals[i][0])
            current[1] = max(current[1], intervals[i][1])
            i += 1
        }
        res.append(current)

        while i < intervals.count {
            res.append(intervals[i])
            i += 1
        }

        return res
    }
}
