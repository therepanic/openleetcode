func longestSubsequence(arr []int, difference int) int {
    dic := make(map[int]int)
    maxLen := 0
    for _, x := range arr {
        if val, ok := dic[x - difference]; ok {
            dic[x] = val + 1
        } else {
            dic[x] = 1
        }
        if dic[x] > maxLen {
            maxLen = dic[x]
        }
    }
    return maxLen
}
