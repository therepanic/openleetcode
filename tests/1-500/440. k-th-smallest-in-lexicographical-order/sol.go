func findKthNumber(n int, k int) int {
    return solve(0, n, k)
}

func solve(current, n, k int) int {
    if k == 0 {
        return current / 10
    }

    start := max(current, 1)
    for i := start; i < current+10; i++ {
        count := numOfChildren(i, i+1, n)
        if count >= k {
            return solve(i*10, n, k-1)
        }
        k -= count
    }

    return -1
}

func numOfChildren(current, neighbour, n int) int {
    if neighbour > n {
        if current > n {
            return 0
        }
        return n - current + 1
    }
    return (neighbour - current) + numOfChildren(current*10, neighbour*10, n)
}

func max(a, b int) int {
    if a > b {
        return a
    }
    return b
}
