func numDupDigitsAtMostN(n int) int {
    s := strconv.Itoa(n + 1)
    digits := make([]int, len(s))
    for i, c := range s {
        digits[i] = int(c - '0')
    }
    nl := len(digits)
    res := 0
    for i := 0; i < nl - 1; i++ {
        res += 9 * perm(9, i)
    }
    used := make([]bool, 10)
    for i, x := range digits {
        start := 0
        if i == 0 {
            start = 1
        }
        for y := start; y < x; y++ {
            if !used[y] {
                res += perm(9 - i, nl - i - 1)
            }
        }
        if used[x] {
            break
        }
        used[x] = true
    }
    return n - res
}

func perm(n, k int) int {
    if k < 0 || k > n {
        return 0
    }
    ans := 1
    for i := 0; i < k; i++ {
        ans *= (n - i)
    }
    return ans
}
