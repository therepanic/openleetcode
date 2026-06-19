func integerReplacement(n int) int {
    var helper func(int64, int) int
    helper = func(x int64, c int) int {
        if x == 1 {
            return c
        }
        if x % 2 == 0 {
            return helper(x >> 1, c + 1)
        } else {
            if x == 3 || ((x >> 1) & 1) == 0 {
                return helper(x - 1, c + 1)
            } else {
                return helper(x + 1, c + 1)
            }
        }
    }
    return helper(int64(n), 0)
}
