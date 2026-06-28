func makesquare(matchsticks []int) bool {
    total := 0
    for _, m := range matchsticks {
        total += m
    }
    if total % 4 != 0 {
        return false
    }
    side := total / 4
    
    sort.Slice(matchsticks, func(i, j int) bool {
        return matchsticks[i] > matchsticks[j]
    })
    
    sides := [4]int{}
    return backtrack(matchsticks, 0, sides, side)
}

func backtrack(matchsticks []int, index int, sides [4]int, side int) bool {
    if index == len(matchsticks) {
        return sides[0] == side && sides[1] == side && sides[2] == side && sides[3] == side
    }
    for i := 0; i < 4; i++ {
        if sides[i] + matchsticks[index] <= side {
            sides[i] += matchsticks[index]
            if backtrack(matchsticks, index + 1, sides, side) {
                return true
            }
            sides[i] -= matchsticks[index]
        }
    }
    return false
}
