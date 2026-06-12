func hammingWeight(n int) int {
	value := uint32(n)
	ans := 0
	for value != 0 {
		ans += int(value & 1)
		value >>= 1
	}
	return ans
}
