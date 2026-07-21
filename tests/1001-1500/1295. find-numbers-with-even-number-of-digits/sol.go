func findNumbers(nums []int) int {
    count := 0
    for _, i := range nums {
        msb := 0
        if i > 0 {
            msb = 31 - bits.LeadingZeros32(uint32(i))
        }
        digits := int(float64(msb)*0.30103) + 1
        if float64(i) >= math.Pow(10, float64(digits)) {
            digits++
        }
        if digits%2 == 0 {
            count++
        }
    }
    return count
}
