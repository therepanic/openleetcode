func evaluate(expression string) int {
    isnum := func(t string) bool {
        return t[0] == '-' || (t[0] >= '0' && t[0] <= '9')
    }
    
    lookup := func(v string, env []map[string]int) int {
        for i := len(env) - 1; i >= 0; i-- {
            if val, ok := env[i][v]; ok {
                return val
            }
        }
        return 0
    }
    
    toks := func(s string) []string {
        res := []string{}
        i, n, bal, st := 0, len(s), 0, 0
        for i < n {
            c := s[i]
            if c == '(' {
                bal++
            } else if c == ')' {
                bal--
            } else if c == ' ' && bal == 0 {
                if st < i {
                    res = append(res, s[st:i])
                }
                st = i + 1
            }
            i++
        }
        if st < n {
            res = append(res, s[st:])
        }
        return res
    }
    
    var evals func(string, []map[string]int) int
    evals = func(e string, env []map[string]int) int {
        if e[0] != '(' {
            if isnum(e) {
                val, _ := strconv.Atoi(e)
                return val
            }
            return lookup(e, env)
        }
        inner := e[1 : len(e)-1]
        parts := toks(inner)
        op := parts[0]
        if op == "add" {
            return evals(parts[1], env) + evals(parts[2], env)
        }
        if op == "mult" {
            return evals(parts[1], env) * evals(parts[2], env)
        }
        loc := make(map[string]int)
        env = append(env, loc)
        i := 1
        for i < len(parts)-1 {
            v := parts[i]
            val := evals(parts[i+1], env)
            loc[v] = val
            i += 2
        }
        ans := evals(parts[len(parts)-1], env)
        env = env[:len(env)-1]
        return ans
    }
    
    return evals(expression, []map[string]int{})
}
