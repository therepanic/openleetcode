func largestNumber(nums []int) string {
	parts := make([]string, len(nums))
	for i, num := range nums {
		parts[i] = itoa(num)
	}
	for i := 0; i < len(parts); i++ {
		for j := i + 1; j < len(parts); j++ {
			if parts[j]+parts[i] > parts[i]+parts[j] {
				parts[i], parts[j] = parts[j], parts[i]
			}
		}
	}
	if len(parts) > 0 && parts[0] == "0" {
		return "0"
	}
	ans := ""
	for _, part := range parts {
		ans += part
	}
	return ans
}

func itoa(num int) string {
	if num == 0 {
		return "0"
	}
	if num < 0 {
		return "-" + itoa(-num)
	}
	digits := make([]byte, 0)
	for num > 0 {
		digits = append(digits, byte('0'+num%10))
		num /= 10
	}
	for left, right := 0, len(digits)-1; left < right; left, right = left+1, right-1 {
		digits[left], digits[right] = digits[right], digits[left]
	}
	return string(digits)
}
