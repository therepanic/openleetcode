func minimumDistance(word string) int {
    cal := func(a, b int) int {
        return abs(a/6-b/6) + abs(a%6-b%6)
    }

    n := len(word)
    dp := make([]int, 26)
    ndp := make([]int, 26)

    for i := 1; i < n; i++ {
        p := int(word[i-1] - 'A')
        t := int(word[i] - 'A')

        for j := 0; j < 26; j++ {
            ndp[j] = dp[j] + cal(p, t)
        }

        for j := 0; j < 26; j++ {
            ndp[p] = min(ndp[p], dp[j]+cal(j, t))
        }

        dp, ndp = ndp, dp
    }

    ans := dp[0]
    for _, v := range dp {
        if v < ans {
            ans = v
        }
    }
    return ans
}

func abs(x int) int {
    if x < 0 {
        return -x
    }
    return x
}
