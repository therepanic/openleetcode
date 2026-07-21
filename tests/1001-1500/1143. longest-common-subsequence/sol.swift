class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        let m = text1.count
        let n = text2.count
        var memo = Array(repeating: Array(repeating: -1, count: n), count: m)
        let arr1 = Array(text1)
        let arr2 = Array(text2)

        func solve(_ i: Int, _ j: Int) -> Int {
            if i >= m || j >= n { return 0 }
            if memo[i][j] != -1 { return memo[i][j] }

            if arr1[i] == arr2[j] {
                memo[i][j] = 1 + solve(i + 1, j + 1)
            } else {
                memo[i][j] = max(solve(i + 1, j), solve(i, j + 1))
            }
            return memo[i][j]
        }

        return solve(0, 0)
    }
}
