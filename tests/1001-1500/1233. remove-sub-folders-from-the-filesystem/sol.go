func removeSubfolders(folder []string) []string {
    sort.Strings(folder)
    res := []string{}
    for _, f := range folder {
        if len(res) == 0 {
            res = append(res, f)
        } else {
            prev := res[len(res)-1]
            if strings.HasPrefix(f, prev) && len(f) > len(prev) && f[len(prev)] == '/' {
                continue
            } else {
                res = append(res, f)
            }
        }
    }
    return res
}
