func findComplement(num int) int {
    bit := 1
    curr := num
    for curr > 0 {
        num ^= bit
        bit <<= 1
        curr >>= 1
    }
    return num
}
