func fairCandySwap(aliceSizes []int, bobSizes []int) []int {
    sumA, sumB := 0, 0
    for _, a := range aliceSizes {
        sumA += a
    }
    for _, b := range bobSizes {
        sumB += b
    }
    diff := (sumB - sumA) / 2
    setB := make(map[int]bool)
    for _, b := range bobSizes {
        setB[b] = true
    }
    for _, a := range aliceSizes {
        if setB[a+diff] {
            return []int{a, a + diff}
        }
    }
    return []int{}
}
