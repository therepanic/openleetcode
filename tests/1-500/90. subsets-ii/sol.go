func subsetsWithDup(nums []int) [][]int {
	sort.Ints(nums)
	res := [][]int{}
	cur := []int{}
	var dfs func(int)
	dfs = func(start int) {
		copyCur := append([]int{}, cur...)
		res = append(res, copyCur)
		for i := start; i < len(nums); i++ {
			if i > start && nums[i] == nums[i-1] {
				continue
			}
			cur = append(cur, nums[i])
			dfs(i + 1)
			cur = cur[:len(cur)-1]
		}
	}
	dfs(0)
	return res
}
