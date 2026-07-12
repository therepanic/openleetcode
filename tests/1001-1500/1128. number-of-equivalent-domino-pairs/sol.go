func numEquivDominoPairs(dominoes [][]int) int {
    mpp := make([]int, 100)
    count := 0
    for _, d := range dominoes {
        a, b := d[0], d[1]
        key := a*10 + b
        if a > b {
            key = b*10 + a
        }
        count += mpp[key]
        mpp[key]++
    }
    return count
}
