func winnerSquareGame(n int) bool {
    memo := make([][]int, 2)
    for i := range memo {
        memo[i] = make([]int, n+1)
        for j := range memo[i] {
            memo[i][j] = -1
        }
    }
    var dp func(player, stones int) bool
    dp = func(player, stones int) bool {
        if stones == 0 {
            return false
        }
        if memo[player][stones] != -1 {
            return memo[player][stones] == 1
        }
        sqrt := int(math.Sqrt(float64(stones)))
        for i := sqrt; i >= 1; i-- {
            sq := i * i
            if sq == stones || !dp(player^1, stones-sq) {
                memo[player][stones] = 1
                return true
            }
        }
        memo[player][stones] = 0
        return false
    }
    return dp(0, n)
}
