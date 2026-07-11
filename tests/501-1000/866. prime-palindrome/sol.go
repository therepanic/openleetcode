func primePalindrome(n int) int {
    isPrime := func(num int) bool {
        if num < 2 {
            return false
        }
        if num % 2 == 0 {
            return num == 2
        }
        for i := 3; i*i <= num; i += 2 {
            if num % i == 0 {
                return false
            }
        }
        return true
    }

    isPalindrome := func(s string) bool {
        for i, j := 0, len(s)-1; i < j; i, j = i+1, j-1 {
            if s[i] != s[j] {
                return false
            }
        }
        return true
    }

    if n >= 8 && n <= 11 {
        return 11
    }

    for {
        s := strconv.Itoa(n)
        if len(s) % 2 == 0 && n > 11 {
            n = int(math.Pow(10, float64(len(s)))) + 1
            continue
        }
        if isPalindrome(s) && isPrime(n) {
            return n
        }
        n++
        if n > 2 && n % 2 == 0 {
            n++
        }
    }
}
