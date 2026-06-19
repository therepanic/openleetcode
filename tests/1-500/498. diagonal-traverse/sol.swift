class Solution {
    func findDiagonalOrder(_ mat: [[Int]]) -> [Int] {
        if mat.isEmpty || mat[0].isEmpty {
            return []
        }
        
        let m = mat.count, n = mat[0].count
        var result = [Int]()
        var row = 0, col = 0
        
        for _ in 0..<m*n {
            result.append(mat[row][col])
            
            if (row + col) % 2 == 0 {
                if col == n - 1 {
                    row += 1
                } else if row == 0 {
                    col += 1
                } else {
                    row -= 1
                    col += 1
                }
            } else {
                if row == m - 1 {
                    col += 1
                } else if col == 0 {
                    row += 1
                } else {
                    row += 1
                    col -= 1
                }
            }
        }
        
        return result
    }
}
