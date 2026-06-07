func romanToInt(s string) int {
	roman := map[byte]int{'I': 1, 'V': 5, 'X': 10, 'L': 50, 'C': 100, 'D': 500, 'M': 1000}
	res := 0
	for i := 0; i+1 < len(s); i++ {
		if roman[s[i]] < roman[s[i+1]] {
			res -= roman[s[i]]
		} else {
			res += roman[s[i]]
		}
	}
	return res + roman[s[len(s)-1]]
}
