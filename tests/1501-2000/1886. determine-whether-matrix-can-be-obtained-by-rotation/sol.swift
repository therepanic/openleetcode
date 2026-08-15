class Solution {
    func findRotation(_ mat: [[Int]], _ target: [[Int]]) -> Bool {
        var current = mat
        for _ in 0..<4 {
            if current == target { return true }
            current = rotate(current)
        }
        return false
    }
    
    private func rotate(_ mat: [[Int]]) -> [[Int]] {
        let n = mat.count
        var res = Array(repeating: Array(repeating: 0, count: n), count: n)
        for i in 0..<n {
            for j in 0..<n {
                res[j][n - 1 - i] = mat[i][j]
            }
        }
        return res
    }
}
