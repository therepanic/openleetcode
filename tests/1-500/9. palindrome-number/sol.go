func isPalindrome(x int) bool {
	if x < 0 {
		return false
	}

	var rev int64 = 0
	num := x
	for num != 0 {
		rev = rev*10 + int64(num%10)
		num /= 10
	}
	return rev == int64(x)
}
