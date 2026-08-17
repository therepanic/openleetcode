func checkPalindromeFormation(a string, b string) bool {
    return check(a, b) || check(b, a)
}

func check(a, b string) bool {
    i, j := 0, len(a)-1
    for i < j && a[i] == b[j] {
        i++
        j--
    }
    return isPalindrome(a[i:j+1]) || isPalindrome(b[i:j+1])
}

func isPalindrome(s string) bool {
    for i, j := 0, len(s)-1; i < j; i, j = i+1, j-1 {
        if s[i] != s[j] {
            return false
        }
    }
    return true
}
