class Solution {
    func restoreMatrix(_ rowSum: [Int], _ colSum: [Int]) -> [[Int]] {
        var rowSum = rowSum
        var colSum = colSum
        let m = rowSum.count, n = colSum.count
        var matrix = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
        var i = 0, j = 0
        while i < m && j < n {
            let val = min(rowSum[i], colSum[j])
            matrix[i][j] = val
            rowSum[i] -= val
            colSum[j] -= val
            if rowSum[i] == 0 { i += 1 }
            if colSum[j] == 0 { j += 1 }
        }
        return matrix
    }
}
