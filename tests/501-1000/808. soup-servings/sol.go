func soupServings(n int) float64 {
    if n > 5000 {
        return 1.0
    }
    units := int(math.Ceil(float64(n) / 25.0))
    memo := make(map[string]float64)
    
    var calcProb func(int, int) float64
    calcProb = func(soupA, soupB int) float64 {
        key := fmt.Sprintf("%d,%d", soupA, soupB)
        if val, ok := memo[key]; ok {
            return val
        }
        if soupA <= 0 && soupB <= 0 {
            return 0.5
        }
        if soupA <= 0 {
            return 1.0
        }
        if soupB <= 0 {
            return 0.0
        }
        result := 0.25 * (
            calcProb(soupA-4, soupB) +
            calcProb(soupA-3, soupB-1) +
            calcProb(soupA-2, soupB-2) +
            calcProb(soupA-1, soupB-3))
        memo[key] = result
        return result
    }
    
    return calcProb(units, units)
}
