import Foundation

class Solution {
    func numPoints(_ darts: [[Int]], _ r: Int) -> Int {
        var ans = 1
        let radius = Double(r)
        let radiusSq = radius * radius
        for i in 0..<darts.count {
            let x1 = Double(darts[i][0]), y1 = Double(darts[i][1])
            if i + 1 >= darts.count { continue }
            for j in (i + 1)..<darts.count {
                let x2 = Double(darts[j][0]), y2 = Double(darts[j][1])
                let dx = x2 - x1, dy = y2 - y1
                let distanceSq = dx * dx + dy * dy
                if distanceSq > 4.0 * radiusSq { continue }
                let distance = sqrt(distanceSq)
                let midpointX = (x1 + x2) / 2.0
                let midpointY = (y1 + y2) / 2.0
                let offset = sqrt(max(0.0, radiusSq - distanceSq / 4.0))
                let normalX = -dy / distance
                let normalY = dx / distance
                for sign in [-1.0, 1.0] {
                    let centerX = midpointX + sign * offset * normalX
                    let centerY = midpointY + sign * offset * normalY
                    var count = 0
                    for dart in darts {
                        let ex = Double(dart[0]) - centerX
                        let ey = Double(dart[1]) - centerY
                        if ex * ex + ey * ey <= radiusSq + 1e-9 { count += 1 }
                    }
                    ans = max(ans, count)
                }
            }
        }
        return ans
    }
}
