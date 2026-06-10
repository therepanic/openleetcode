func reverseBits(n int) int {
	value := uint32(n)
	var ans uint32 = 0
	for i := 0; i < 32; i++ {
		ans = (ans << 1) | (value & 1)
		value >>= 1
	}
	return int(ans)
}
