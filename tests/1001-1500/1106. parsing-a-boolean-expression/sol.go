func parseBoolExpr(expression string) bool {
    st := [][]interface{}{[]interface{}{}}
    for _, ch := range expression {
        switch ch {
        case '&':
            st = append(st, []interface{}{"&"})
        case '|':
            st = append(st, []interface{}{"|"})
        case '!':
            st = append(st, []interface{}{"!"})
        case 't':
            st[len(st)-1] = append(st[len(st)-1], true)
        case 'f':
            st[len(st)-1] = append(st[len(st)-1], false)
        case ')':
            popped := st[len(st)-1]
            st = st[:len(st)-1]
            op := popped[0].(string)
            args := popped[1:]
            top := &st[len(st)-1]
            switch op {
            case "&":
                res := true
                for _, v := range args {
                    res = res && v.(bool)
                }
                *top = append(*top, res)
            case "|":
                res := false
                for _, v := range args {
                    res = res || v.(bool)
                }
                *top = append(*top, res)
            case "!":
                *top = append(*top, !args[0].(bool))
            }
        }
    }
    return st[0][0].(bool)
}
