func findRepeatedDnaSequences(s string) []string {
	seen := map[string]int{}
	ans := make([]string, 0)
	for i := 0; i+10 <= len(s); i++ {
		sub := s[i : i+10]
		if seen[sub] == 1 {
			ans = append(ans, sub)
		}
		seen[sub]++
	}
	return ans
}
