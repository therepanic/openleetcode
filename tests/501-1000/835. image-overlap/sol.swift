class Solution {
    func largestOverlap(_ img1: [[Int]], _ img2: [[Int]]) -> Int {
        let n = img1.count
        var a = [(Int, Int)]()
        var b = [(Int, Int)]()
        for i in 0..<n {
            for j in 0..<n {
                if img1[i][j] == 1 { a.append((i, j)) }
                if img2[i][j] == 1 { b.append((i, j)) }
            }
        }
        var cnt = [String: Int]()
        for (x1, y1) in a {
            for (x2, y2) in b {
                let key = "\(x1 - x2),\(y1 - y2)"
                cnt[key, default: 0] += 1
            }
        }
        return cnt.values.max() ?? 0
    }
}
