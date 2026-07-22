func balancedString(s string) int {
    n := len(s)
    each := n / 4
    count := make(map[byte]int)
    for i := 0; i < n; i++ {
        count[s[i]]++
    }
    extra := make(map[byte]int)
    for k, v := range count {
        if v > each {
            extra[k] = v - each
        }
    }
    if len(extra) == 0 {
        return 0
    }
    left := 0
    res := int(^uint(0) >> 1)
    curr := make(map[byte]int)
    for right := 0; right < n; right++ {
        if _, ok := extra[s[right]]; ok {
            curr[s[right]]++
        }
        allMet := true
        for k, v := range extra {
            if curr[k] < v {
                allMet = false
                break
            }
        }
        for allMet && left <= right {
            if right-left+1 < res {
                res = right - left + 1
            }
            if _, ok := curr[s[left]]; ok {
                curr[s[left]]--
                if curr[s[left]] == 0 {
                    delete(curr, s[left])
                }
            }
            left++
            allMet = true
            for k, v := range extra {
                if curr[k] < v {
                    allMet = false
                    break
                }
            }
        }
    }
    return res
}
