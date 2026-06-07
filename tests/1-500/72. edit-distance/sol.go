func minDistance(word1 string, word2 string) int {
	dp := make([]int, len(word2)+1)
	for j := 0; j <= len(word2); j++ {
		dp[j] = j
	}

	for i := 1; i <= len(word1); i++ {
		prev := dp[0]
		dp[0] = i
		for j := 1; j <= len(word2); j++ {
			temp := dp[j]
			if word1[i-1] == word2[j-1] {
				dp[j] = prev
			} else {
				best := prev
				if dp[j] < best {
					best = dp[j]
				}
				if dp[j-1] < best {
					best = dp[j-1]
				}
				dp[j] = 1 + best
			}
			prev = temp
		}
	}

	return dp[len(word2)]
}
