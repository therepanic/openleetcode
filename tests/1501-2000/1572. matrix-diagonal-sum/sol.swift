class Solution {
    func diagonalSum(_ mat: [[Int]]) -> Int {
        var summ = 0
        let n = mat.count
        for i in 0..<n {
            summ += mat[i][i]
            summ += mat[i][n - 1 - i]
        }
        if n % 2 == 1 {
            summ -= mat[n / 2][n / 2]
        }
        return summ
    }
}
