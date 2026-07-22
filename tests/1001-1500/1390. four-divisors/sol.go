func sumFourDivisors(nums []int) int {
    if len(nums) == 0 {
        return 0
    }
    maxNum := nums[0]
    for _, num := range nums {
        if num > maxNum {
            maxNum = num
        }
    }
    if maxNum < 2 {
        return 0
    }

    sieve := make([]bool, maxNum+1)
    for i := 2; i <= maxNum; i++ {
        sieve[i] = true
    }

    for p := 2; p*p <= maxNum; p++ {
        if sieve[p] {
            for multiple := p * p; multiple <= maxNum; multiple += p {
                sieve[multiple] = false
            }
        }
    }

    total := 0
    for _, x := range nums {
        // p^3 case
        p := int(math.Round(math.Pow(float64(x), 1.0/3.0)))
        if p >= 0 && p <= maxNum && p*p*p == x && sieve[p] {
            total += 1 + p + p*p + x
            continue
        }

        // p * q case
        for i := 2; i*i <= x; i++ {
            if x%i == 0 {
                j := x / i
                if i != j && i <= maxNum && j <= maxNum && sieve[i] && sieve[j] {
                    total += 1 + i + j + x
                }
                break
            }
        }
    }
    return total
}
