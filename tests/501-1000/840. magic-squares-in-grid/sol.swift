class Solution {
    func numMagicSquaresInside(_ grid: [[Int]]) -> Int {
        let m = grid.count, n = grid[0].count
        if m < 3 || n < 3 { return 0 }
        var c = 0
        for i in 0..<m-2 {
            for j in 0..<n-2 {
                if isMagicSquare(grid, i, j) {
                    c += 1
                }
            }
        }
        return c
    }

    private func isMagicSquare(_ grid: [[Int]], _ r: Int, _ c: Int) -> Bool {
        if grid[r+1][c+1] != 5 { return false }

        let a = grid[r][c], b = grid[r][c+1], d = grid[r][c+2]
        let e = grid[r+1][c], f = grid[r+1][c+2]
        let h = grid[r+2][c], i = grid[r+2][c+1], j = grid[r+2][c+2]

        var seen = [Bool](repeating: false, count: 10)
        let arr = [a, b, d, e, f, h, i, j, 5]
        for x in arr {
            if x < 1 || x > 9 || seen[x] { return false }
            seen[x] = true
        }

        if a + j != 10 { return false }
        if b + i != 10 { return false }
        if d + h != 10 { return false }
        if e + f != 10 { return false }

        if a + b + d != 15 { return false }
        if h + i + j != 15 { return false }
        if a + e + h != 15 { return false }
        if d + f + j != 15 { return false }
        if a + 5 + j != 15 { return false }
        if d + 5 + h != 15 { return false }

        return true
    }
}
