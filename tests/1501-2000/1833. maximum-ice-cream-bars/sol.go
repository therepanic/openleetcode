func maxIceCream(costs []int, coins int) int {
    xMin := costs[0]
    xMax := costs[0]
    for _, x := range costs {
        if x < xMin { xMin = x }
        if x > xMax { xMax = x }
    }
    freq := make([]int, xMax+1)
    for _, x := range costs {
        freq[x]++
        if x < xMin { xMin = x }
    }
    cnt := 0
    for x := xMin; x <= xMax; x++ {
        f := freq[x]
        if f == 0 { continue }
        buy := coins / x
        if buy > f { buy = f }
        if buy == 0 { break }
        cnt += buy
        coins -= buy * x
    }
    return cnt
}
