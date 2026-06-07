func minWindow(s string, t string) string {
	if len(s) < len(t) || len(t) == 0 {
		return ""
	}

	need := make(map[byte]int)
	for i := 0; i < len(t); i++ {
		need[t[i]]++
	}

	missing := len(t)
	left, bestL, bestLen := 0, 0, 1<<31-1
	for right := 0; right < len(s); right++ {
		c := s[right]
		if need[c] > 0 {
			missing--
		}
		need[c]--

		for missing == 0 {
			if right-left+1 < bestLen {
				bestLen = right - left + 1
				bestL = left
			}
			d := s[left]
			left++
			need[d]++
			if need[d] > 0 {
				missing++
			}
		}
	}

	if bestLen == 1<<31-1 {
		return ""
	}
	return s[bestL : bestL+bestLen]
}
