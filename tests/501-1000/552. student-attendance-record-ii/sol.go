func checkRecord(n int) int {
    mod := 1000000007
    dp := [2][3]int{{1, 0, 0}, {0, 0, 0}}
    
    for i := 0; i < n; i++ {
        ndp := [2][3]int{{0, 0, 0}, {0, 0, 0}}
        for absences := 0; absences < 2; absences++ {
            for lates := 0; lates < 3; lates++ {
                cur := dp[absences][lates]
                if cur == 0 {
                    continue
                }
                ndp[absences][0] = (ndp[absences][0] + cur) % mod
                if absences == 0 {
                    ndp[1][0] = (ndp[1][0] + cur) % mod
                }
                if lates < 2 {
                    ndp[absences][lates+1] = (ndp[absences][lates+1] + cur) % mod
                }
            }
        }
        dp = ndp
    }
    
    total := 0
    for _, row := range dp {
        for _, value := range row {
            total = (total + value) % mod
        }
    }
    return total
}
