func maxProfit(prices []int) int {
    a := -1 << 63
    b := 0
    c := 0
    for _, p := range prices {
        newA := max(a, c - p)
        newB := a + p
        newC := max(c, b)
        a, b, c = newA, newB, newC
    }
    return max(b, c)
}

func max(x, y int) int {
    if x > y {
        return x
    }
    return y
}
