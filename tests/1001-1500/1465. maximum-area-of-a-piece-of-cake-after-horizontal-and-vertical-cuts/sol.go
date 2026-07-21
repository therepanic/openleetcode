func maxArea(h int, w int, horizontalCuts []int, verticalCuts []int) int {
    const MOD = 1_000_000_007
    
    sort.Ints(horizontalCuts)
    sort.Ints(verticalCuts)
    
    maxH := max(horizontalCuts[0], h - horizontalCuts[len(horizontalCuts)-1])
    for i := 1; i < len(horizontalCuts); i++ {
        maxH = max(maxH, horizontalCuts[i] - horizontalCuts[i-1])
    }
    
    maxV := max(verticalCuts[0], w - verticalCuts[len(verticalCuts)-1])
    for i := 1; i < len(verticalCuts); i++ {
        maxV = max(maxV, verticalCuts[i] - verticalCuts[i-1])
    }
    
    return (maxH * maxV) % MOD
}
