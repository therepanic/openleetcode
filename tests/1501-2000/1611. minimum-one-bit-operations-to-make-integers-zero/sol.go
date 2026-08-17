func minimumOneBitOperations(n int) int {
    highest := 0
    for i := 0; i < 32; i++ {
        if n & (1 << i) != 0 {
            highest = i
        }
    }

    ans := 0
    add := true
    for i := highest; i >= 0; i-- {
        if n & (1 << i) != 0 {
            val := (1 << (i + 1)) - 1
            if add {
                ans += val
            } else {
                ans -= val
            }
            add = !add
        }
    }

    return ans
}
