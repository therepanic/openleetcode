class Solution {
    func countPoints(_ points: [[Int]], _ queries: [[Int]]) -> [Int] {
        var result = Array(repeating: 0, count: queries.count)
        for i in 0..<queries.count {
            for j in 0..<points.count {
                let dx = queries[i][0] - points[j][0]
                let dy = queries[i][1] - points[j][1]
                if dx * dx + dy * dy <= queries[i][2] * queries[i][2] {
                    result[i] += 1
                }
            }
        }
        return result
    }
}
