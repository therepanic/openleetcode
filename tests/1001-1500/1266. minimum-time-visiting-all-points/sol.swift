class Solution {
    func minTimeToVisitAllPoints(_ points: [[Int]]) -> Int {
        var ans = 0
        for i in 1..<points.count {
            let dx = abs(points[i][0] - points[i - 1][0])
            let dy = abs(points[i][1] - points[i - 1][1])
            ans += max(dx, dy)
        }
        return ans
    }
}
