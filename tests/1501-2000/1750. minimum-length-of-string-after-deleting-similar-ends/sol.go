func minimumLength(s string) int {
    left := 0
    right := len(s) - 1
    for left < right && s[left] == s[right] {
        ch := s[left]
        for left <= right && s[left] == ch {
            left++
        }
        for left <= right && s[right] == ch {
            right--
        }
    }
    if right-left+1 < 0 {
        return 0
    }
    return right - left + 1
}
