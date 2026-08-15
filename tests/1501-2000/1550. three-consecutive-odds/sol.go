func threeConsecutiveOdds(arr []int) bool {
    s := ""
    for _, x := range arr {
        s += fmt.Sprintf("%d", x & 1)
    }
    return strings.Contains(s, "111")
}
