class Solution {
    func numSpecial(_ mat: [[Int]]) -> Int {
        let m = mat.count, n = mat[0].count
        var row = [Int](repeating: 0, count: m)
        var col = [Int](repeating: 0, count: n)

        for i in 0..<m {
            for j in 0..<n {
                if mat[i][j] == 1 {
                    row[i] += 1
                    col[j] += 1
                }
            }
        }

        var result = 0
        for i in 0..<m {
            for j in 0..<n {
                if mat[i][j] == 1 && row[i] == 1 && col[j] == 1 {
                    result += 1
                }
            }
        }
        return result
    }
}
