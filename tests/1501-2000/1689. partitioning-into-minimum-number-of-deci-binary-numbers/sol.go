func minPartitions(n string) int {
    max := 0
    for _, ch := range n {
        if int(ch-'0') > max {
            max = int(ch - '0')
        }
    }
    return max
}
