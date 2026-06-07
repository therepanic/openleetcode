func combine(n int, k int) [][]int {
	res := [][]int{}
	cur := []int{}
	var dfs func(int)
	dfs = func(start int) {
		if len(cur) == k {
			tmp := make([]int, len(cur))
			copy(tmp, cur)
			res = append(res, tmp)
			return
		}
		for i := start; i <= n; i++ {
			cur = append(cur, i)
			dfs(i + 1)
			cur = cur[:len(cur)-1]
		}
	}
	dfs(1)
	return res
}
