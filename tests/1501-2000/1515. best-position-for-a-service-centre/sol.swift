class Solution {
    func getMinDistSum(_ positions: [[Int]]) -> Double {
        func distSum(_ x: Double, _ y: Double) -> Double {
            var sum = 0.0
            for p in positions {
                let dx = x - Double(p[0])
                let dy = y - Double(p[1])
                sum += sqrt(dx * dx + dy * dy)
            }
            return sum
        }
        
        var x = 0.0, y = 0.0
        for p in positions {
            x += Double(p[0])
            y += Double(p[1])
        }
        x /= Double(positions.count)
        y /= Double(positions.count)
        
        var ans = distSum(x, y)
        var chg = 100.0
        let dirs = [(-1.0, 0.0), (0.0, -1.0), (0.0, 1.0), (1.0, 0.0)]
        
        while chg > 1e-6 {
            var zoom = true
            for (dx, dy) in dirs {
                let xx = x + chg * dx
                let yy = y + chg * dy
                let dd = distSum(xx, yy)
                if dd < ans {
                    ans = dd
                    x = xx
                    y = yy
                    zoom = false
                    break
                }
            }
            if zoom { chg /= 2 }
        }
        return ans
    }
}
