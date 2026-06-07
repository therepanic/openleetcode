func climbStairs(n int) int {
	if n <= 3 {
		return n
	}
	prev2, prev1 := 2, 3
	for step := 4; step <= n; step++ {
		cur := prev1 + prev2
		prev2 = prev1
		prev1 = cur
	}
	return prev1
}
