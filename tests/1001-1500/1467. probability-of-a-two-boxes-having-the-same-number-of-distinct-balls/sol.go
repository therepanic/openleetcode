func getProbability(balls []int) float64 {
    colors := len(balls)
    total := 0
    for _, count := range balls {
        total += count
    }
    half := total / 2

    dp := make([][][]int64, half+1)
    for used := 0; used <= half; used++ {
        dp[used] = make([][]int64, colors+1)
        for left := 0; left <= colors; left++ {
            dp[used][left] = make([]int64, colors+1)
        }
    }
    dp[0][0][0] = 1

    for _, count := range balls {
        next := make([][][]int64, half+1)
        for used := 0; used <= half; used++ {
            next[used] = make([][]int64, colors+1)
            for left := 0; left <= colors; left++ {
                next[used][left] = make([]int64, colors+1)
            }
        }
        for used := 0; used <= half; used++ {
            for left := 0; left <= colors; left++ {
                for right := 0; right <= colors; right++ {
                    ways := dp[used][left][right]
                    if ways == 0 {
                        continue
                    }
                    for inLeft := 0; inLeft <= count && used+inLeft <= half; inLeft++ {
                        nextLeft := left
                        if inLeft > 0 {
                            nextLeft++
                        }
                        nextRight := right
                        if inLeft < count {
                            nextRight++
                        }
                        next[used+inLeft][nextLeft][nextRight] +=
                            ways * choose(count, inLeft)
                    }
                }
            }
        }
        dp = next
    }

    var favorable int64
    for distinct := 0; distinct <= colors; distinct++ {
        favorable += dp[half][distinct][distinct]
    }
    return float64(favorable) / float64(choose(total, half))
}

func choose(n, k int) int64 {
    if k > n-k {
        k = n - k
    }
    result := int64(1)
    for i := 1; i <= k; i++ {
        result = result * int64(n-k+i) / int64(i)
    }
    return result
}
