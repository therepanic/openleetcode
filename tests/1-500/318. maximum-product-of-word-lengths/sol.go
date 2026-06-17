func maxProduct(words []string) int {
    n := len(words)
    bitmasks := make([]int, n)
    for i, w := range words {
        mask := 0
        for _, c := range w {
            mask |= 1 << (c - 'a')
        }
        bitmasks[i] = mask
    }
    maxProd := 0
    for i := 0; i < n; i++ {
        for j := i + 1; j < n; j++ {
            if bitmasks[i] & bitmasks[j] == 0 {
                prod := len(words[i]) * len(words[j])
                if prod > maxProd {
                    maxProd = prod
                }
            }
        }
    }
    return maxProd
}
