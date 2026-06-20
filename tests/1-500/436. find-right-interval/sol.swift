class Solution {
    func findRightInterval(_ intervals: [[Int]]) -> [Int] {
        let n = intervals.count
        var starts: [(Int, Int)] = []
        for (i, interval) in intervals.enumerated() {
            starts.append((interval[0], i))
        }
        starts.sort { $0.0 < $1.0 }
        var res: [Int] = []
        for interval in intervals {
            let end = interval[1]
            var left = 0
            var right = n - 1
            var idx = -1
            while left <= right {
                let mid = (left + right) / 2
                if starts[mid].0 >= end {
                    idx = starts[mid].1
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            }
            res.append(idx)
        }
        return res
    }
}
