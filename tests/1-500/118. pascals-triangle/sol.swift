
class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        var result = [[Int]]()
        for i in 0..<numRows {
            var row = Array(repeating: 1, count: i + 1)
            if i >= 2 {
                for j in 1..<i {
                    row[j] = result[i - 1][j - 1] + result[i - 1][j]
                }
            }
            result.append(row)
        }
        return result
    }
}
