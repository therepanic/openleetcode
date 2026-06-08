func addBinary(a string, b string) string {
	i := len(a) - 1
	j := len(b) - 1
	carry := 0
	res := make([]byte, 0)

	for i >= 0 || j >= 0 || carry > 0 {
		sum := carry
		if i >= 0 {
			sum += int(a[i] - '0')
			i--
		}
		if j >= 0 {
			sum += int(b[j] - '0')
			j--
		}
		res = append(res, byte(sum%2)+'0')
		carry = sum / 2
	}

	for left, right := 0, len(res)-1; left < right; left, right = left+1, right-1 {
		res[left], res[right] = res[right], res[left]
	}
	return string(res)
}
