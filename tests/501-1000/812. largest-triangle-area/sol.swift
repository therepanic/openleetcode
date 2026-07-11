class Solution {
    func largestTriangleArea(_ points: [[Int]]) -> Double {
        var maxArea = 0.0
        let n = points.count
        for i in 0..<n {
            let x1 = points[i][0], y1 = points[i][1]
            for j in i..<n {
                let x2 = points[j][0], y2 = points[j][1]
                for k in j..<n {
                    let x3 = points[k][0], y3 = points[k][1]
                    let area = abs(0.5 * Double(x1 * (y2 - y3) + x2 * (y3 - y1) + x3 * (y1 - y2)))
                    if area > maxArea {
                        maxArea = area
                    }
                }
            }
        }
        return maxArea
    }
}
