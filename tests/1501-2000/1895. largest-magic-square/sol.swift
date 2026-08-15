class Solution {
    func largestMagicSquare(_ grid: [[Int]]) -> Int {
        let m = grid.count, n = grid[0].count
        var res = 1

        func isValid(_ i: Int, _ j: Int, _ k: Int) -> Bool {
            var s = -1
            for x in i..<(i+k) {
                var row = 0
                for y in j..<(j+k) { row += grid[x][y] }
                if s == -1 { s = row }
                else if s != row { return false }
            }

            for y in j..<(j+k) {
                var col = 0
                for x in i..<(i+k) { col += grid[x][y] }
                if col != s { return false }
            }

            var d1 = 0, d2 = 0
            for d in 0..<k {
                d1 += grid[i+d][j+d]
                d2 += grid[i+d][j+k-1-d]
            }
            return d1 == s && d2 == s
        }

        if min(m, n) < 2 { return res }
        for k in 2...min(m, n) {
            for i in 0...(m-k) {
                for j in 0...(n-k) {
                    if isValid(i, j, k) { res = k }
                }
            }
        }
        return res
    }
}
