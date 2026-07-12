func heightChecker(heights []int) int {
    count := 0
    s := make([]int, len(heights))
    copy(s, heights)
    sort.Ints(s)
    for i := 0; i < len(heights); i++ {
        if heights[i] != s[i] {
            count++
        }
    }
    return count
}
