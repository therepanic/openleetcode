func maxDepthAfterSplit(seq string) []int {
    res := make([]int, len(seq))
    depth := 0
    for i, ch := range seq {
        if ch == '(' {
            depth++
            res[i] = depth % 2
        } else {
            res[i] = depth % 2
            depth--
        }
    }
    return res
}
