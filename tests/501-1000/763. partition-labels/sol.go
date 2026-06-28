func partitionLabels(s string) []int {
	last := make([]int, 26)
	for i := 0; i < len(s); i++ {
		last[s[i]-'a'] = i
	}
	ans := []int{}
	start, end := 0, 0
	for i := 0; i < len(s); i++ {
		if last[s[i]-'a'] > end {
			end = last[s[i]-'a']
		}
		if i == end {
			ans = append(ans, end-start+1)
			start = i + 1
		}
	}
	return ans
}
