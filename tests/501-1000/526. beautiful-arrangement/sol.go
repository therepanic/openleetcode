func countArrangement(n int) int {
    visited := make([]bool, n+1)
    var backtrack func(int) int
    backtrack = func(index int) int {
        if index > n {
            return 1
        }
        count := 0
        for i := 1; i <= n; i++ {
            if !visited[i] && (i%index == 0 || index%i == 0) {
                visited[i] = true
                count += backtrack(index + 1)
                visited[i] = false
            }
        }
        return count
    }
    return backtrack(1)
}
