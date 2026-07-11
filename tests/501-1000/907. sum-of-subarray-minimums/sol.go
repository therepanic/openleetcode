func sumSubarrayMins(arr []int) int {
    const MOD = 1_000_000_007
    n := len(arr)
    stack := make([]int, 0, n)
    res := make([]int, n)
    for i := 0; i < n; i++ {
        for len(stack) > 0 && arr[stack[len(stack)-1]] > arr[i] {
            stack = stack[:len(stack)-1]
        }
        j := -1
        if len(stack) > 0 {
            j = stack[len(stack)-1]
        }
        if j >= 0 {
            res[i] = res[j]
        }
        res[i] = (res[i] + (i-j)*arr[i]) % MOD
        stack = append(stack, i)
    }
    sum := 0
    for _, v := range res {
        sum = (sum + v) % MOD
    }
    return sum
}
