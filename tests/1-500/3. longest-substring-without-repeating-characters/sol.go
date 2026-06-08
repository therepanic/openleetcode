func lengthOfLongestSubstring(s string) int {
	lastSeen := make(map[rune]int)
	start := 0
	res := 0
	for end, c := range s {
		if prev, ok := lastSeen[c]; ok && prev >= start {
			start = prev + 1
		}
		if end-start+1 > res {
			res = end - start + 1
		}
		lastSeen[c] = end
	}
	return res
}
