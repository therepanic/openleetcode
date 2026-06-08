func myAtoi(s string) int {
	i := 0
	for i < len(s) && s[i] == ' ' {
		i++
	}
	if i == len(s) {
		return 0
	}

	sign := 1
	if s[i] == '+' || s[i] == '-' {
		if s[i] == '-' {
			sign = -1
		}
		i++
	}

	var res int64 = 0
	for i < len(s) && s[i] >= '0' && s[i] <= '9' {
		digit := int64(s[i] - '0')
		if sign == 1 {
			if res > 214748364 || (res == 214748364 && digit > 7) {
				return 2147483647
			}
		} else {
			if res > 214748364 || (res == 214748364 && digit > 8) {
				return -2147483648
			}
		}
		res = res*10 + digit
		i++
	}

	if sign == 1 {
		return int(res)
	}
	return int(-res)
}
