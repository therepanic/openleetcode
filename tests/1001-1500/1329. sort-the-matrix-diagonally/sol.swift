class Solution {
    func diagonalSort(_ mat: [[Int]]) -> [[Int]] {
        var mat = mat
        let m = mat.count, n = mat[0].count
        var diagonals = [Int: [Int]]()
        
        for i in 0..<m {
            for j in 0..<n {
                let key = i - j
                diagonals[key, default: []].append(mat[i][j])
            }
        }
        
        for key in diagonals.keys {
            diagonals[key]?.sort(by: >)
        }
        
        for i in 0..<m {
            for j in 0..<n {
                mat[i][j] = diagonals[i - j]!.removeLast()
            }
        }
        
        return mat
    }
}
