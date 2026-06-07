func longestPalindrome(s string) string {
	if len(s) == 0 {
		return ""
	}

	start, best := 0, 1
	for i := 0; i < len(s); i++ {
		len1 := expandLongestPalindrome(s, i, i)
		len2 := expandLongestPalindrome(s, i, i+1)
		length := len1
		if len2 > length {
			length = len2
		}
		if length > best {
			best = length
			start = i - (length-1)/2
		}
	}

	return s[start : start+best]
}

func expandLongestPalindrome(s string, left, right int) int {
	for left >= 0 && right < len(s) && s[left] == s[right] {
		left--
		right++
	}
	return right - left - 1
}
