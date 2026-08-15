func longestPalindrome(word1 string, word2 string) int {
    word := word1 + word2
    n := len(word)
    memo := make([][]int, n)
    for i := range memo {
        memo[i] = make([]int, n)
        for j := range memo[i] {
            memo[i][j] = -1
        }
    }
    
    var fn func(lo, hi int) int
    fn = func(lo, hi int) int {
        if lo >= hi {
            if lo == hi {
                return 1
            }
            return 0
        }
        if memo[lo][hi] != -1 {
            return memo[lo][hi]
        }
        if word[lo] == word[hi] {
            memo[lo][hi] = 2 + fn(lo+1, hi-1)
        } else {
            a := fn(lo+1, hi)
            b := fn(lo, hi-1)
            if a > b {
                memo[lo][hi] = a
            } else {
                memo[lo][hi] = b
            }
        }
        return memo[lo][hi]
    }
    
    ans := 0
    seen := make(map[byte]bool)
    for i := 0; i < len(word1); i++ {
        c := word1[i]
        if seen[c] {
            continue
        }
        seen[c] = true
        idx1 := strings.IndexByte(word1, c)
        idx2 := strings.LastIndexByte(word2, c)
        if idx1 != -1 && idx2 != -1 {
            val := fn(idx1, idx2 + len(word1))
            if val > ans {
                ans = val
            }
        }
    }
    return ans
}
