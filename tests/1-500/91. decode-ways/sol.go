func numDecodings(s string) int {
	if len(s) == 0 || s[0] == '0' {
		return 0
	}

	prev2, prev1 := 1, 1
	for i := 1; i < len(s); i++ {
		curr := 0
		if s[i] != '0' {
			curr += prev1
		}
		value := int(s[i-1]-'0')*10 + int(s[i]-'0')
		if value >= 10 && value <= 26 {
			curr += prev2
		}
		prev2, prev1 = prev1, curr
	}

	return prev1
}
