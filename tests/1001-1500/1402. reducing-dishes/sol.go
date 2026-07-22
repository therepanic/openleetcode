func maxSatisfaction(satisfaction []int) int {
    sort.Sort(sort.Reverse(sort.IntSlice(satisfaction)))
    presum, res := 0, 0
    for _, s := range satisfaction {
        presum += s
        if presum < 0 {
            break
        }
        res += presum
    }
    return res
}
