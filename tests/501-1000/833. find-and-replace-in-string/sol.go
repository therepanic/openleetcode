func findReplaceString(s string, indices []int, sources []string, targets []string) string {
    patch := make(map[int][2]string)
    for k, i := range indices {
        src := sources[k]
        tgt := targets[k]
        if i+len(src) <= len(s) && s[i:i+len(src)] == src {
            patch[i] = [2]string{src, tgt}
        }
    }
    var res []byte
    i := 0
    n := len(s)
    for i < n {
        if pair, ok := patch[i]; ok {
            res = append(res, pair[1]...)
            i += len(pair[0])
        } else {
            res = append(res, s[i])
            i++
        }
    }
    return string(res)
}
