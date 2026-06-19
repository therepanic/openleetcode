func canIWin(maxChoosableInteger int, desiredTotal int) bool {
    if desiredTotal <= 0 {
        return true
    }
    sum := maxChoosableInteger * (maxChoosableInteger + 1) / 2
    if sum < desiredTotal {
        return false
    }
    
    memo := make(map[int]bool)
    
    var canWin func(int, int) bool
    canWin = func(state int, total int) bool {
        if val, ok := memo[state]; ok {
            return val
        }
        for i := 1; i <= maxChoosableInteger; i++ {
            bit := 1 << (i - 1)
            if (state & bit) == 0 {
                if i >= total || !canWin(state | bit, total - i) {
                    memo[state] = true
                    return true
                }
            }
        }
        memo[state] = false
        return false
    }
    
    return canWin(0, desiredTotal)
}
