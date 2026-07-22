func uniqueOccurrences(arr []int) bool {
    d := make(map[int]int)
    for _, i := range arr {
        if _, exists := d[i]; exists {
            d[i]++
        } else {
            d[i] = 1
        }
    }
    s := make(map[int]bool)
    for _, value := range d {
        if s[value] {
            return false
        }
        s[value] = true
    }
    return true
}
