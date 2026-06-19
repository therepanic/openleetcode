class Solution {
    func findMinArrowShots(_ points: [[Int]]) -> Int {
        let sortedPoints = points.sorted { $0[1] < $1[1] }
        var arrows = 1
        var end = sortedPoints[0][1]
        for point in sortedPoints {
            if point[0] > end {
                arrows += 1
                end = point[1]
            }
        }
        return arrows
    }
}
