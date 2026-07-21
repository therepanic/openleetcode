func isGoodArray(nums []int) bool {
    g := nums[0]
    for _, num := range nums[1:] {
        g = gcd(g, num)
    }
    return g == 1
}

func gcd(a, b int) int {
    for b != 0 {
        a, b = b, a%b
    }
    return a
}
