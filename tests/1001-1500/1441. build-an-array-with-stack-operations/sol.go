func buildArray(target []int, n int) []string {
    s := []int{}
    res := []string{}
    a := 0
    for i := 1; i <= n; i++ {
        if len(s) == len(target) {
            match := true
            for j := 0; j < len(s); j++ {
                if s[j] != target[j] {
                    match = false
                    break
                }
            }
            if match {
                return res
            }
        }
        s = append(s, i)
        res = append(res, "Push")
        if s[a] != target[a] {
            s = s[:len(s)-1]
            res = append(res, "Pop")
        } else {
            a++
        }
    }
    return res
}
