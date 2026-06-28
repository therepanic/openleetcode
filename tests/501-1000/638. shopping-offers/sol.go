func shoppingOffers(price []int, special [][]int, needs []int) int {
    p := len(price)
    memo := make(map[string]int)
    
    var dp func(curr []int) int
    dp = func(curr []int) int {
        allZero := true
        for _, v := range curr {
            if v != 0 {
                allZero = false
                break
            }
        }
        if allZero {
            return 0
        }
        
        key := fmt.Sprintf("%v", curr)
        if val, ok := memo[key]; ok {
            return val
        }
        
        n := len(curr)
        res := 0
        for i := 0; i < p; i++ {
            res += curr[i] * price[i]
        }
        
        for _, offer := range special {
            canUse := true
            for i := 0; i < n; i++ {
                if curr[i] < offer[i] {
                    canUse = false
                    break
                }
            }
            if canUse {
                newCurr := make([]int, n)
                for i := 0; i < n; i++ {
                    newCurr[i] = curr[i] - offer[i]
                }
                cand := offer[len(offer)-1] + dp(newCurr)
                if cand < res {
                    res = cand
                }
            }
        }
        
        memo[key] = res
        return res
    }
    
    return dp(needs)
}
