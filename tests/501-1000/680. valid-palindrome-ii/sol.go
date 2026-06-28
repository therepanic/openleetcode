func validPalindrome(s string) bool {
    isPalindrome := func(l, r int) bool {
        for l < r {
            if s[l] != s[r] {
                return false
            }
            l++
            r--
        }
        return true
    }
    
    left, right := 0, len(s)-1
    for left < right {
        if s[left] != s[right] {
            return isPalindrome(left+1, right) || isPalindrome(left, right-1)
        }
        left++
        right--
    }
    return true
}
