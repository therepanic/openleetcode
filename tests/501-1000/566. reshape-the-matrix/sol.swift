class Solution {
    func matrixReshape(_ mat: [[Int]], _ r: Int, _ c: Int) -> [[Int]] {
        let m = mat.count
        let n = mat[0].count
        if m * n != r * c {
            return mat
        }
        
        var reshaped = Array(repeating: Array(repeating: 0, count: c), count: r)
        var count = 0
        
        for i in 0..<m {
            for j in 0..<n {
                reshaped[count / c][count % c] = mat[i][j]
                count += 1
            }
        }
        
        return reshaped
    }
}
