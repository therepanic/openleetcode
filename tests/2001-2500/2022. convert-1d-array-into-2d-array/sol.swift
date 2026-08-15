class Solution {
    func construct2DArray(_ original: [Int], _ m: Int, _ n: Int) -> [[Int]] {
        let k = original.count
        if m * n != k { return [] }
        var ans = Array(repeating: Array(repeating: 0, count: n), count: m)
        var idx = 0
        for i in 0..<m {
            for j in 0..<n {
                ans[i][j] = original[idx]
                idx += 1
            }
        }
        return ans
    }
}
