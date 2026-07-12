func braceExpansionII(expression string) []string {
    stack := [][]string{}
    res := []string{}
    cur := []string{}
    for i := 0; i < len(expression); i++ {
        v := expression[i]
        if v >= 'a' && v <= 'z' {
            if len(cur) == 0 {
                cur = append(cur, string(v))
            } else {
                next := make([]string, len(cur))
                for j, c := range cur {
                    next[j] = c + string(v)
                }
                cur = next
            }
        } else if v == '{' {
            stack = append(stack, res)
            stack = append(stack, cur)
            res = []string{}
            cur = []string{}
        } else if v == '}' {
            pre := stack[len(stack)-1]
            stack = stack[:len(stack)-1]
            preRes := stack[len(stack)-1]
            stack = stack[:len(stack)-1]
            merged := append([]string{}, res...)
            merged = append(merged, cur...)
            if len(pre) == 0 {
                cur = merged
            } else {
                next := []string{}
                for _, p := range pre {
                    for _, c := range merged {
                        next = append(next, p + c)
                    }
                }
                cur = next
            }
            res = preRes
        } else if v == ',' {
            res = append(res, cur...)
            cur = []string{}
        }
    }
    res = append(res, cur...)
    set := make(map[string]bool)
    for _, s := range res {
        set[s] = true
    }
    result := []string{}
    for s := range set {
        result = append(result, s)
    }
    sort.Strings(result)
    return result
}
