class Solution {
    func maxPoints(_ points: [[Int]]) -> Int {
        if points.count <= 2 { return points.count }
        var best = 0
        for i in 0..<points.count {
            var count = [String: Int]()
            var local = 0
            var duplicates = 1
            let x1 = points[i][0]
            let y1 = points[i][1]
            for j in (i + 1)..<points.count {
                var dx = points[j][0] - x1
                var dy = points[j][1] - y1
                if dx == 0 && dy == 0 {
                    duplicates += 1
                    continue
                }
                let g = gcd(dx, dy)
                dx /= g
                dy /= g
                if dx < 0 {
                    dx = -dx
                    dy = -dy
                } else if dx == 0 {
                    dy = 1
                } else if dy == 0 {
                    dx = 1
                }
                let key = "\(dx)/\(dy)"
                let next = (count[key] ?? 0) + 1
                count[key] = next
                if next > local { local = next }
            }
            if local + duplicates > best {
                best = local + duplicates
            }
        }
        return best
    }

    private func gcd(_ a: Int, _ b: Int) -> Int {
        var x = abs(a)
        var y = abs(b)
        while y != 0 {
            let t = x % y
            x = y
            y = t
        }
        return x
    }
}
