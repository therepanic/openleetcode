func isPalindrome(s string) bool {
    left, right := 0, len(s)-1
    for left < right {
        for left < right && !isAlphaNumeric(s[left]) { left++ }
        for left < right && !isAlphaNumeric(s[right]) { right-- }
        if toLowerByte(s[left]) != toLowerByte(s[right]) { return false }
        left++
        right--
    }
    return true
}

func isAlphaNumeric(ch byte) bool {
    return (ch >= 'a' && ch <= 'z') || (ch >= 'A' && ch <= 'Z') || (ch >= '0' && ch <= '9')
}

func toLowerByte(ch byte) byte {
    if ch >= 'A' && ch <= 'Z' { return ch - 'A' + 'a' }
    return ch
}
