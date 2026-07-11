class Solution {
    func transpose(_ matrix: [[Int]]) -> [[Int]] {
        let row = matrix.count
        let col = matrix[0].count
        var trans = Array(repeating: Array(repeating: 0, count: row), count: col)

        for i in 0..<col {
            for j in 0..<row {
                trans[i][j] = matrix[j][i]
            }
        }

        return trans
    }
}
