func numberWays(hats [][]int) int {
    const mod = 1_000_000_007
    n := len(hats)
    likedByHat := make([][]int, 41)
    for i := range likedByHat {
        likedByHat[i] = []int{}
    }
    for person, choices := range hats {
        for _, hat := range choices {
            likedByHat[hat] = append(likedByHat[hat], person)
        }
    }
    
    dp := make([]int, 1<<n)
    dp[0] = 1
    for hat := 1; hat <= 40; hat++ {
        updated := make([]int, 1<<n)
        copy(updated, dp)
        for mask, count := range dp {
            if count == 0 {
                continue
            }
            for _, person := range likedByHat[hat] {
                personBit := 1 << person
                if mask & personBit == 0 {
                    target := mask | personBit
                    updated[target] = (updated[target] + count) % mod
                }
            }
        }
        dp = updated
    }
    return dp[(1<<n)-1]
}
