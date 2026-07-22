func minSteps(s string, t string) int {
    dic := make(map[rune]int)
    for _, ch := range t {
        dic[ch]++
    }
    for _, ch := range s {
        if val, ok := dic[ch]; ok && val > 0 {
            dic[ch]--
        }
    }
    sum := 0
    for _, val := range dic {
        sum += val
    }
    return sum
}
