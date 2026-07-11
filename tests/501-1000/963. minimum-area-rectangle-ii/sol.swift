class Solution {
    func minAreaFreeRect(_ points: [[Int]]) -> Double {
        var ans = Double.infinity
        var seen = [String: [(Int, Int)]]()
        let n = points.count
        for i in 0..<n {
            let x0 = points[i][0], y0 = points[i][1]
            for j in i+1..<n {
                let x1 = points[j][0], y1 = points[j][1]
                let cx = Double(x0 + x1) / 2.0
                let cy = Double(y0 + y1) / 2.0
                let d2 = (x0 - x1) * (x0 - x1) + (y0 - y1) * (y0 - y1)
                let key = "\(cx),\(cy),\(d2)"
                if let list = seen[key] {
                    for (xx, yy) in list {
                        let area = sqrt(Double((x0 - xx) * (x0 - xx) + (y0 - yy) * (y0 - yy)) *
                                        Double((x1 - xx) * (x1 - xx) + (y1 - yy) * (y1 - yy)))
                        ans = min(ans, area)
                    }
                }
                seen[key, default: []].append((x0, y0))
            }
        }
        return ans == Double.infinity ? 0.0 : ans
    }
}
