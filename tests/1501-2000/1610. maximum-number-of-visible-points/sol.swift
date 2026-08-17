class Solution {
    func visiblePoints(_ points: [[Int]], _ angle: Int, _ location: [Int]) -> Int {
        var angles: [Double] = []
        var same = 0
        let x0 = location[0], y0 = location[1]
        
        for p in points {
            let dx = p[0] - x0
            let dy = p[1] - y0
            if dx == 0 && dy == 0 {
                same += 1
                continue
            }
            let ang = atan2(Double(dy), Double(dx)) * 180.0 / Double.pi
            angles.append(ang)
        }
        
        if angles.isEmpty { return same }
        
        angles.sort()
        let n = angles.count
        var full = angles
        full += angles.map { $0 + 360 }
        
        var maxVis = 0
        var j = 0
        for i in 0..<n {
            while j < full.count && full[j] - full[i] <= Double(angle) {
                j += 1
            }
            maxVis = max(maxVis, j - i)
        }
        
        return maxVis + same
    }
}
