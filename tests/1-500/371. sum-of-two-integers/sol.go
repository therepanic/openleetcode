func getSum(a int, b int) int {
    a &= 0xffffffff
    b &= 0xffffffff
    for b != 0 {
        c := (a & b) << 1
        a = (a ^ b) & 0xffffffff
        b = c & 0xffffffff
    }
    if a < 0x80000000 {
        return a
    }
    return ^(a ^ 0xffffffff)
}
