class Solution {
    func largestSubmatrix(_ matrix: [[Int]]) -> Int {
        let m = matrix.count
        let n = matrix[0].count
        var maxArea = 0
        var h = [Int](repeating: 0, count: n)
        for i in 0..<m {
            for j in 0..<n {
                if j < matrix[i].count && matrix[i][j] == 1 {
                    h[j] += 1
                } else {
                    h[j] = 0
                }
            }
            let sh = h.sorted(by: >)
            for j in 0..<n {
                if sh[j] == 0 { break }
                maxArea = max(maxArea, sh[j] * (j + 1))
            }
        }
        return maxArea
    }
}
