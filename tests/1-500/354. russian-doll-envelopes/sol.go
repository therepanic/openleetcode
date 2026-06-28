func maxEnvelopes(envelopes [][]int) int {
    sort.Slice(envelopes, func(i, j int) bool {
        if envelopes[i][0] == envelopes[j][0] {
            return envelopes[i][1] > envelopes[j][1]
        }
        return envelopes[i][0] < envelopes[j][0]
    })
    result := []int{}
    for _, e := range envelopes {
        h := e[1]
        idx := sort.SearchInts(result, h)
        if idx == len(result) {
            result = append(result, h)
        } else {
            result[idx] = h
        }
    }
    return len(result)
}
