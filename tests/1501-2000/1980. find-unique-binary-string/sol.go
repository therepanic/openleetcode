func findDifferentBinaryString(nums []string) string {
    result := make([]byte, len(nums))
    for i, s := range nums {
        if s[i] == '0' {
            result[i] = '1'
        } else {
            result[i] = '0'
        }
    }
    return string(result)
}
