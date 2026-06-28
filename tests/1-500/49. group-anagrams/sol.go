func groupAnagrams(strs []string) [][]string {
    groups := map[string][]string{}
    keys := []string{}

    for _, word := range strs {
        b := []byte(word)
        sort.Slice(b, func(i, j int) bool { return b[i] < b[j] })
        key := string(b)
        if _, ok := groups[key]; !ok {
            keys = append(keys, key)
        }
        groups[key] = append(groups[key], word)
    }

    res := make([][]string, 0, len(keys))
    for _, key := range keys {
        res = append(res, groups[key])
    }
    return res
}
