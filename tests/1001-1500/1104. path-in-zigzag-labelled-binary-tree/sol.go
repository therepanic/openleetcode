func pathInZigZagTree(label int) []int {
    res := []int{}
    cur := label
    for cur > 0 {
        res = append(res, cur)
        start := 1
        for start*2 <= cur {
            start *= 2
        }
        end := start*2 - 1
        cur = (start + end - cur) / 2
    }
    for i, j := 0, len(res)-1; i < j; i, j = i+1, j-1 {
        res[i], res[j] = res[j], res[i]
    }
    return res
}
