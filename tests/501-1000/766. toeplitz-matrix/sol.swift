class Solution {
    func isToeplitzMatrix(_ matrix: [[Int]]) -> Bool {
        let n = matrix.count
        let m = matrix[0].count
        
        for i in 0..<n - 1 {
            for j in 0..<m - 1 {
                if matrix[i][j] != matrix[i + 1][j + 1] {
                    return false
                }
            }
        }
        
        return true
    }
}
