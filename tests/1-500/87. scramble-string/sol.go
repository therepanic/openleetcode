func isScramble(s1 string, s2 string) bool {
	if len(s1) != len(s2) {
		return false
	}
	memo := map[string]bool{}
	seen := map[string]bool{}
	var dfs func(string, string) bool
	dfs = func(a, b string) bool {
		if a == b {
			return true
		}
		key := a + "#" + b
		if seen[key] {
			return memo[key]
		}
		seen[key] = true
		var cnt [26]int
		for i := 0; i < len(a); i++ {
			cnt[a[i]-'a']++
			cnt[b[i]-'a']--
		}
		for _, x := range cnt {
			if x != 0 {
				memo[key] = false
				return false
			}
		}
		for i := 1; i < len(a); i++ {
			if dfs(a[:i], b[:i]) && dfs(a[i:], b[i:]) {
				memo[key] = true
				return true
			}
			if dfs(a[:i], b[len(b)-i:]) && dfs(a[i:], b[:len(b)-i]) {
				memo[key] = true
				return true
			}
		}
		memo[key] = false
		return false
	}
	return dfs(s1, s2)
}
