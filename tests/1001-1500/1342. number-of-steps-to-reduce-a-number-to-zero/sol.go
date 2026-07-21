func numberOfSteps(num int) int {
    if num == 0 {
        return 0
    }
    bitLen := 0
    ones := 0
    for n := num; n > 0; n >>= 1 {
        bitLen++
        if n&1 == 1 {
            ones++
        }
    }
    return bitLen - 1 + ones
}
