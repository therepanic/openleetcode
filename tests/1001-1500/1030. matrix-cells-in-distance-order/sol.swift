class Solution {
    func allCellsDistOrder(_ rows: Int, _ cols: Int, _ rCenter: Int, _ cCenter: Int) -> [[Int]] {
        var result = [[Int]]()
        for r in 0..<rows {
            for c in 0..<cols {
                result.append([r, c])
            }
        }
        result.sort { a, b in
            let d1 = abs(a[0] - rCenter) + abs(a[1] - cCenter)
            let d2 = abs(b[0] - rCenter) + abs(b[1] - cCenter)
            if d1 != d2 { return d1 < d2 }
            if a[0] != b[0] { return a[0] < b[0] }
            return a[1] < b[1]
        }
        return result
    }
}
