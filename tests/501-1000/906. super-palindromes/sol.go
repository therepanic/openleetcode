func superpalindromesInRange(left string, right string) int {
    L, _ := strconv.ParseInt(left, 10, 64)
    R, _ := strconv.ParseInt(right, 10, 64)
    count := 0
    for i := int64(1); i <= 100000; i++ {
        s := strconv.FormatInt(i, 10)
        rev := reverseString(s)
        val1, _ := strconv.ParseInt(s+rev, 10, 64)
        val2, _ := strconv.ParseInt(s+rev[1:], 10, 64)
        sqval1 := val1 * val1
        sqval2 := val2 * val2
        if L <= sqval1 && sqval1 <= R {
            ssqval1 := strconv.FormatInt(sqval1, 10)
            if ssqval1 == reverseString(ssqval1) {
                count++
            }
        }
        if L <= sqval2 && sqval2 <= R {
            ssqval2 := strconv.FormatInt(sqval2, 10)
            if ssqval2 == reverseString(ssqval2) {
                count++
            }
        }
        if val2 > R {
            break
        }
    }
    return count
}

func reverseString(s string) string {
    runes := []rune(s)
    for i, j := 0, len(runes)-1; i < j; i, j = i+1, j-1 {
        runes[i], runes[j] = runes[j], runes[i]
    }
    return string(runes)
}
