func numOfWays(nums []int) int {
    const MOD = 1000000007
    n := len(nums)
    
    nCr := make([][]int64, n+1)
    for i := range nCr {
        nCr[i] = make([]int64, n+1)
        nCr[i][0] = 1
        nCr[i][i] = 1
        for j := 1; j < i; j++ {
            nCr[i][j] = (nCr[i-1][j-1] + nCr[i-1][j]) % MOD
        }
    }
    
    var dfs func([]int) int64
    dfs = func(arr []int) int64 {
        if len(arr) <= 2 {
            return 1
        }
        root := arr[0]
        left := make([]int, 0)
        right := make([]int, 0)
        for _, x := range arr[1:] {
            if x < root {
                left = append(left, x)
            } else {
                right = append(right, x)
            }
        }
        leftWays := dfs(left)
        rightWays := dfs(right)
        L, R := len(left), len(right)
        return (nCr[L+R][L] * leftWays % MOD * rightWays) % MOD
    }
    
    return int((dfs(nums) - 1) % MOD)
}
