func findGCD(nums []int) int {
    a := nums[0]
    b := nums[0]
    for _, v := range nums {
        if v < a {
            a = v
        }
        if v > b {
            b = v
        }
    }
    return gcd(a, b)
}

func gcd(a, b int) int {
    for b != 0 {
        a, b = b, a%b
    }
    return a
}
