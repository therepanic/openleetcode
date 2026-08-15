func countPalindromicSubsequence(s string) int {
    n := len(s)
    first := make([]int, 26)
    last := make([]int, 26)
    for i := 0; i < 26; i++ {
        first[i] = -1
        last[i] = -1
    }

    for i := 0; i < n; i++ {
        c := int(s[i] - 'a')
        if first[c] == -1 {
            first[c] = i
        }
        last[c] = i
    }

    ans := 0
    for c := 0; c < 26; c++ {
        if first[c] != -1 && last[c]-first[c] > 1 {
            mask := 0
            for i := first[c] + 1; i < last[c]; i++ {
                mask |= 1 << int(s[i]-'a')
            }
            ans += bits.OnesCount(uint(mask))
        }
    }
    return ans
}
