func gcdOfStrings(str1 string, str2 string) string {
    if str1 + str2 != str2 + str1 {
        return ""
    }
    
    gcd := func(len1, len2 int) int {
        minVal := min(len1, len2)
        for i := minVal; i >= 1; i-- {
            if len1 % i == 0 && len2 % i == 0 {
                return i
            }
        }
        return 1
    }
    
    return str1[:gcd(len(str1), len(str2))]
}
