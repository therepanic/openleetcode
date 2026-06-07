class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        let intervals = intervals.sorted { a, b in a[0] < b[0] }
        var merged = [[Int]]()

        for interval in intervals {
            if merged.isEmpty || merged[merged.count - 1][1] < interval[0] {
                merged.append(interval)
            } else if interval[1] > merged[merged.count - 1][1] {
                merged[merged.count - 1][1] = interval[1]
            }
        }

        return merged
    }
}
