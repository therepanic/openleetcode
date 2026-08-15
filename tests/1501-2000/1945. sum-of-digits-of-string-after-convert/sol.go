func getLucky(s string, k int) int {
    res := ""
    for _, c := range s {
        res += strconv.Itoa(int(c - 'a' + 1))
    }
    for i := 0; i < k; i++ {
        sum := 0
        for _, c := range res {
            sum += int(c - '0')
        }
        res = strconv.Itoa(sum)
    }
    result, _ := strconv.Atoi(res)
    return result
}
