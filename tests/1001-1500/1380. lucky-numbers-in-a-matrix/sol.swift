class Solution {
    func luckyNumbers(_ matrix: [[Int]]) -> [Int] {
        let rows = matrix.count
        let cols = matrix[0].count
        var ans: [Int] = []
        for i in 0..<rows {
            for j in 0..<cols {
                var ele1 = Int.max
                for k in 0..<cols {
                    if matrix[i][k] < ele1 {
                        ele1 = matrix[i][k]
                    }
                }
                var ele2 = Int.min
                for k in 0..<rows {
                    if matrix[k][j] > ele2 {
                        ele2 = matrix[k][j]
                    }
                }
                if ele1 == matrix[i][j] && ele2 == matrix[i][j] {
                    ans.append(matrix[i][j])
                }
            }
        }
        return ans
    }
}
