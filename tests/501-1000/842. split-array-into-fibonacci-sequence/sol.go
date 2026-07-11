func splitIntoFibonacci(num string) []int {
    invalid := func(x string) bool {
        return (x[0] == '0' && len(x) > 1) || len(x) > 10 || func() bool {
            val, _ := strconv.ParseInt(x, 10, 64)
            return val >= (1 << 31)
        }()
    }
    
    check := func(a0, a1, num string) []int {
        i := 0
        a0Int, _ := strconv.Atoi(a0)
        a1Int, _ := strconv.Atoi(a1)
        ret := []int{a0Int, a1Int}
        curA0, curA1 := a0, a1
        for i < len(num) {
            a0Val, _ := strconv.ParseInt(curA0, 10, 64)
            a1Val, _ := strconv.ParseInt(curA1, 10, 64)
            res := strconv.FormatInt(a0Val + a1Val, 10)
            j := 0
            for i < len(num) && j < len(res) && res[j] == num[i] {
                j++
                i++
            }
            if j < len(res) || invalid(res) {
                return []int{}
            }
            curA0, curA1 = curA1, res
            resInt, _ := strconv.Atoi(res)
            ret = append(ret, resInt)
        }
        return ret
    }
    
    n := len(num)
    for j := 1; j < n-1; j++ {
        for i := 0; i < j; i++ {
            a0 := num[:i+1]
            a1 := num[i+1:j+1]
            if invalid(a0) || invalid(a1) {
                continue
            }
            ret := check(a0, a1, num[j+1:])
            if len(ret) > 0 {
                return ret
            }
        }
    }
    return []int{}
}
