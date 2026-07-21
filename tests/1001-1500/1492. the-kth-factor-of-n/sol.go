func kthFactor(n int, k int) int {
    ab := []int{}
    for i := 1; i <= n; i++ {
        if n % i == 0 {
            ab = append(ab, i)
        }
    }
    if len(ab) < k {
        return -1
    }
    return ab[k-1]
}
