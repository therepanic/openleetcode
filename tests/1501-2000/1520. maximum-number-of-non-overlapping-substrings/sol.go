func maxNumOfSubstrings(s string) []string {
	first, last := [26]int{}, [26]int{}
	for i := range first { first[i] = len(s) }
	for i := 0; i < len(s); i++ {
		c := s[i] - 'a'
		if i < first[c] { first[c] = i }
		last[c] = i
	}
	answer := []string{}
	previousEnd := -1
	for start := 0; start < len(s); start++ {
		if first[s[start]-'a'] != start { continue }
		end, index, valid := last[s[start]-'a'], start, true
		for index <= end {
			c := s[index] - 'a'
			if first[c] < start { valid = false; break }
			if last[c] > end { end = last[c] }
			index++
		}
		if !valid { continue }
		if start > previousEnd { answer = append(answer, s[start:end+1]) } else { answer[len(answer)-1] = s[start:end+1] }
		previousEnd = end
	}
	return answer
}
