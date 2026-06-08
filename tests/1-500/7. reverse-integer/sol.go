func reverse(x int) int {
	var res int64 = 0
	for x != 0 {
		res = res*10 + int64(x%10)
		x /= 10
		if res < -2147483648 || res > 2147483647 {
			return 0
		}
	}
	return int(res)
}
