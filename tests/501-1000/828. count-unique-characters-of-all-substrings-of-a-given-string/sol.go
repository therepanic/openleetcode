func uniqueLetterString(s string) int {
    n := len(s)
    left := make([]int, n)
    right := make([]int, n)
    prev := make([]int, 26)
    for i := 0; i < 26; i++ {
        prev[i] = -1
    }

    for i := 0; i < n; i++ {
        idx := int(s[i] - 'A')
        left[i] = prev[idx]
        prev[idx] = i
    }

    for i := 0; i < 26; i++ {
        prev[i] = n
    }

    for i := n - 1; i >= 0; i-- {
        idx := int(s[i] - 'A')
        right[i] = prev[idx]
        prev[idx] = i
    }

    ans := 0
    for i := 0; i < n; i++ {
        ans += (i - left[i]) * (right[i] - i)
    }
    return ans
}
