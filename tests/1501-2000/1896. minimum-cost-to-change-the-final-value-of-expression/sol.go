func minOperationsToFlip(expression string) int {
    n := len(expression)
    loc := make(map[int]int)
    stack := []int{}
    for i := n - 1; i >= 0; i-- {
        if expression[i] == ')' {
            stack = append(stack, i)
        } else if expression[i] == '(' {
            loc[stack[len(stack)-1]] = i
            stack = stack[:len(stack)-1]
        }
    }
    
    var fn func(int, int) (int, int)
    fn = func(lo, hi int) (int, int) {
        if lo == hi {
            return int(expression[lo] - '0'), 1
        }
        if expression[hi] == ')' && loc[hi] == lo {
            return fn(lo+1, hi-1)
        }
        mid := hi - 1
        if m, ok := loc[hi]; ok {
            mid = m - 1
        }
        v, c := fn(mid+1, hi)
        vv, cc := fn(lo, mid-1)
        val, chg := 0, 0
        if expression[mid] == '|' {
            val = v | vv
            if v == 0 && vv == 0 {
                if c < cc { chg = c } else { chg = cc }
            } else if v == 1 && vv == 1 {
                if c < cc { chg = c + 1 } else { chg = cc + 1 }
            } else {
                chg = 1
            }
        } else {
            val = v & vv
            if v == 0 && vv == 0 {
                if c < cc { chg = c + 1 } else { chg = cc + 1 }
            } else if v == 1 && vv == 1 {
                if c < cc { chg = c } else { chg = cc }
            } else {
                chg = 1
            }
        }
        return val, chg
    }
    _, ans := fn(0, n-1)
    return ans
}
