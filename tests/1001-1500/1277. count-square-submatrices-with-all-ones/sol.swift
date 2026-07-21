class Solution {
    func countSquares(_ matrix: [[Int]]) -> Int {
        if matrix.isEmpty || matrix[0].isEmpty {
            return 0
        }
        
        var matrix = matrix
        let m = matrix.count
        let n = matrix[0].count
        var res = 0
        
        for i in 0..<m {
            for j in 0..<n {
                if matrix[i][j] == 1 && i > 0 && j > 0 {
                    matrix[i][j] = min(
                        matrix[i-1][j],
                        matrix[i][j-1],
                        matrix[i-1][j-1]
                    ) + 1
                }
                res += matrix[i][j]
            }
        }
        
        return res
    }
}
