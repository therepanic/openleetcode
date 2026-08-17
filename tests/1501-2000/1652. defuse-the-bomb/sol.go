func decrypt(code []int, k int) []int {
    n := len(code)
    result := make([]int, n)
    
    if k == 0 {
        return result
    }

    window := abs(k)
    total := 0

    start := 1
    if k < 0 {
        start = n - window
    }
    end := window
    if k < 0 {
        end = n - 1
    }

    for i := start; i <= end; i++ {
        total += code[i%n]
    }
    for i := 0; i < n; i++ {
        result[i] = total

        total -= code[start%n]
        start++

        end++
        total += code[end%n]
    }
    return result
}

func abs(x int) int {
    if x < 0 {
        return -x
    }
    return x
}
