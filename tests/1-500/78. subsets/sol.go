func subsets(nums []int) [][]int {
	res := [][]int{{}}
	for _, x := range nums {
		sz := len(res)
		for i := 0; i < sz; i++ {
			cur := append([]int{}, res[i]...)
			cur = append(cur, x)
			res = append(res, cur)
		}
	}
	return res
}
