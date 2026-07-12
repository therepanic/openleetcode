func consecutiveNumbersSum(n int) int {
    maxSequenceLength := int((math.Sqrt(float64(1+8*n)) - 1) / 2)
    c := 0
    for i := 2; i <= maxSequenceLength; i++ {
        if i%2 == 1 && n%i == 0 {
            c++
        } else if i%2 == 0 && n%i == i/2 {
            c++
        }
    }
    return c + 1
}
