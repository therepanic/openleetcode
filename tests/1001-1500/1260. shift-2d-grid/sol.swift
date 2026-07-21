class Solution {
    func shiftGrid(_ grid: [[Int]], _ k: Int) -> [[Int]] {
        var grid = grid
        let m = grid.count
        let n = grid[0].count
        let total = m * n
        var k = k % total
        if k == 0 {
            return grid
        }
        
        var lastKElements = [Int](repeating: 0, count: k)
        var i = m - 1
        var x = n - 1
        var count = 0
        
        while count != k {
            lastKElements[count] = grid[i][x]
            if x >= 1 {
                x -= 1
            } else {
                i -= 1
                x = n - 1
            }
            count += 1
        }
        
        var j = m - 1
        var y = n - 1
        
        while i != 0 || x != -1 {
            if x == -1 {
                i -= 1
                x = n - 1
            }
            if y == -1 {
                j -= 1
                y = n - 1
            }
            grid[j][y] = grid[i][x]
            x -= 1
            y -= 1
        }
        
        var idx = 0
        while k > 0 {
            if y == -1 {
                j -= 1
                y = n - 1
            }
            grid[j][y] = lastKElements[idx]
            y -= 1
            k -= 1
            idx += 1
        }
        
        return grid
    }
}
