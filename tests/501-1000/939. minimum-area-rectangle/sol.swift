class Solution {
    func minAreaRect(_ points: [[Int]]) -> Int {
        var cols: [Int: [Int]] = [:]
        for point in points {
            let x = point[0], y = point[1]
            cols[x, default: []].append(y)
        }
        
        var lastX: [String: Int] = [:]
        var best = Int.max
        let sortedX = cols.keys.sorted()
        
        for x in sortedX {
            let ys = cols[x]!.sorted()
            for i in 0..<ys.count {
                for j in (i + 1)..<ys.count {
                    let pair = "\(ys[i]),\(ys[j])"
                    if let prevX = lastX[pair] {
                        let area = (x - prevX) * (ys[j] - ys[i])
                        best = min(best, area)
                    }
                    lastX[pair] = x
                }
            }
        }
        return best == Int.max ? 0 : best
    }
}
