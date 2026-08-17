func kthSmallestPath(destination []int, k int) string {
    rows := destination[0]
    cols := destination[1]
    path := []byte{}
    k--

    for rows > 0 || cols > 0 {
        pathsWithH := 0
        if cols > 0 {
            pathsWithH = combination(rows+cols-1, cols-1)
        }

        if k < pathsWithH {
            path = append(path, 'H')
            cols--
        } else {
            path = append(path, 'V')
            k -= pathsWithH
            rows--
        }
    }
    return string(path)
}

func combination(n, r int) int {
    if r == 0 || r == n {
        return 1
    }
    if r > n-r {
        r = n - r
    }
    result := 1
    for i := 1; i <= r; i++ {
        result = result * (n - r + i) / i
    }
    return result
}
