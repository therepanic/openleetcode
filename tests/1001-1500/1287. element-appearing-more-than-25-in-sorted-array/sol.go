func findSpecialInteger(arr []int) int {
    n := len(arr)
    q := n / 4
    m := make(map[int]int)
    for _, num := range arr {
        m[num]++
        if m[num] > q {
            return num
        }
    }
    return -1
}
