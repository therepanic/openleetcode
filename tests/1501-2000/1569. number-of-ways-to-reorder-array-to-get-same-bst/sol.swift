class Solution {
    func numOfWays(_ nums: [Int]) -> Int {
        let MOD = 1000000007
        let n = nums.count
        
        var nCr = Array(repeating: Array(repeating: 0, count: n+1), count: n+1)
        for i in 0...n {
            nCr[i][0] = 1
            nCr[i][i] = 1
            if i > 0 {
                for j in 1..<i {
                    nCr[i][j] = (nCr[i-1][j-1] + nCr[i-1][j]) % MOD
                }
            }
        }
        
        func dfs(_ arr: [Int]) -> Int {
            if arr.count <= 2 { return 1 }
            let root = arr[0]
            let left = arr.dropFirst().filter { $0 < root }
            let right = arr.dropFirst().filter { $0 > root }
            let leftWays = dfs(Array(left))
            let rightWays = dfs(Array(right))
            let L = left.count, R = right.count
            return (nCr[L+R][L] * leftWays % MOD * rightWays) % MOD
        }
        
        return (dfs(nums) - 1 + MOD) % MOD
    }
}
