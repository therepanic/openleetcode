import "strconv"

func addOperators(num string, target int) []string {
    res := []string{}
    n := len(num)
    
    var backtrack func(idx int, path string, curr int64, prev int64)
    backtrack = func(idx int, path string, curr int64, prev int64) {
        if idx == n {
            if curr == int64(target) {
                res = append(res, path)
            }
            return
        }
        for i := idx; i < n; i++ {
            if i > idx && num[idx] == '0' {
                break
            }
            s := num[idx : i+1]
            val, _ := strconv.ParseInt(s, 10, 64)
            if idx == 0 {
                backtrack(i+1, s, val, val)
            } else {
                backtrack(i+1, path+"+"+s, curr+val, val)
                backtrack(i+1, path+"-"+s, curr-val, -val)
                backtrack(i+1, path+"*"+s, (curr-prev)+(prev*val), prev*val)
            }
        }
    }
    
    if n > 0 {
        backtrack(0, "", 0, 0)
    }
    return res
}
