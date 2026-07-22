class Solution {
    func maxSizeSlices(_ slices: [Int]) -> Int {
        let n = slices.count
        let m = n / 3

        func dp(_ slicesSubset: [Int]) -> Int {
            let k = slicesSubset.count
            var dpTable = Array(repeating: Array(repeating: 0, count: m + 1), count: k + 1)
            for i in 1...k {
                for j in 1...min(i, m) {
                    dpTable[i][j] = max(dpTable[i - 1][j], (i > 1 ? dpTable[i - 2][j - 1] : 0) + slicesSubset[i - 1])
                }
            }
            return dpTable[k][m]
        }

        return max(dp(Array(slices[0..<n-1])), dp(Array(slices[1..<n])))
    }
}
