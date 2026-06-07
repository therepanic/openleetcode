func grayCode(n int) []int {
	total := 1 << n
	res := make([]int, 0, total)
	for i := 0; i < total; i++ {
		res = append(res, i^(i>>1))
	}
	return res
}
