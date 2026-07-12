func bitwiseComplement(n int) int {
    if n == 0 {
        return 1
    }
    bitLength := 0
    temp := n
    for temp > 0 {
        bitLength++
        temp >>= 1
    }
    mask := (1 << bitLength) - 1
    return n ^ mask
}
