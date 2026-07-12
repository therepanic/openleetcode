class Solution {
    func numSubmatrixSumTarget(_ matrix: [[Int]], _ target: Int) -> Int {
        var matrix = matrix
        let m = matrix.count, n = matrix[0].count
        for row in 0..<m {
            for col in 1..<n {
                matrix[row][col] += matrix[row][col - 1]
            }
        }
        var count = 0
        for c1 in 0..<n {
            for c2 in c1..<n {
                var prefixSumMap = [0: 1]
                var sumVal = 0
                for row in 0..<m {
                    sumVal += matrix[row][c2] - (c1 > 0 ? matrix[row][c1 - 1] : 0)
                    count += prefixSumMap[sumVal - target] ?? 0
                    prefixSumMap[sumVal] = (prefixSumMap[sumVal] ?? 0) + 1
                }
            }
        }
        return count
    }
}
