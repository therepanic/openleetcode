func getNoZeroIntegers(n int) []int {
    for i := 1; i < n; i++ {
        if !containsZero(i) && !containsZero(n - i) {
            return []int{i, n - i}
        }
    }
    return []int{}
}

func containsZero(num int) bool {
    for num > 0 {
        if num%10 == 0 {
            return true
        }
        num /= 10
    }
    return false
}
