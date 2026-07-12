func largestValsFromLabels(values []int, labels []int, numWanted int, useLimit int) int {
    n := len(values)
    pairs := make([][2]int, n)
    for i := 0; i < n; i++ {
        pairs[i] = [2]int{values[i], labels[i]}
    }
    sort.Slice(pairs, func(i, j int) bool {
        return pairs[i][0] > pairs[j][0]
    })
    res := 0
    freq := make(map[int]int)
    for _, pair := range pairs {
        if numWanted == 0 {
            break
        }
        value := pair[0]
        label := pair[1]
        if freq[label] < useLimit {
            res += value
            freq[label]++
            numWanted--
        }
    }
    return res
}
