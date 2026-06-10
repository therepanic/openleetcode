import "strconv"

func fractionToDecimal(numerator int, denominator int) string {
	if numerator == 0 {
		return "0"
	}
	result := make([]byte, 0, 32)
	if (numerator < 0) != (denominator < 0) {
		result = append(result, '-')
	}
	num := int64(numerator)
	if num < 0 {
		num = -num
	}
	den := int64(denominator)
	if den < 0 {
		den = -den
	}
	result = append(result, strconv.FormatInt(num/den, 10)...)
	rem := num % den
	if rem == 0 {
		return string(result)
	}
	result = append(result, '.')
	seen := map[int64]int{}
	for rem != 0 {
		if idx, ok := seen[rem]; ok {
			result = append(result[:idx], append([]byte{'('}, result[idx:]...)...)
			result = append(result, ')')
			break
		}
		seen[rem] = len(result)
		rem *= 10
		result = append(result, strconv.FormatInt(rem/den, 10)...)
		rem %= den
	}
	return string(result)
}
