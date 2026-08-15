func beautySum(s string) int {
    n := len(s)
    sumOfBeauty := 0
    for i := 0; i < n; i++ {
        freq := make([]int, 26)
        for j := i; j < n; j++ {
            freq[s[j]-'a']++
            maxi := -1
            mini := int(^uint(0) >> 1) // max int
            for _, diff := range freq {
                if diff > 0 {
                    if diff > maxi { maxi = diff }
                    if diff < mini { mini = diff }
                }
            }
            sumOfBeauty += maxi - mini
        }
    }
    return sumOfBeauty
}
