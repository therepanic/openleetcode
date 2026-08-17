func getMaximumGenerated(n int) int {
    if n == 0 {
        return 0
    } else if n == 1 || n == 2 {
        return 1
    } else {
        a := make([]int, n+1)
        a[0] = 0
        a[1] = 1
        v := 1
        for i := 2; i <= n; i++ {
            if i%2 == 0 {
                a[i] = a[v]
            } else {
                a[i] = a[v] + a[v+1]
                v++
            }
        }
        max := 0
        for _, val := range a {
            if val > max {
                max = val
            }
        }
        return max
    }
}
