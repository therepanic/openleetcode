func findMaxForm(strs []string, m int, n int) int {
    dp := map[[2]int]int{{0, 0}: 0}
    for _, s := range strs {
        zeros := 0
        ones := 0
        for _, c := range s {
            if c == '0' {
                zeros++
            } else {
                ones++
            }
        }
        newDp := make(map[[2]int]int)
        for k, v := range dp {
            newDp[k] = v
        }
        for k, size := range dp {
            z, o := k[0], k[1]
            newZ, newO := z+zeros, o+ones
            if newZ <= m && newO <= n {
                key := [2]int{newZ, newO}
                if val, ok := newDp[key]; ok {
                    if size+1 > val {
                        newDp[key] = size + 1
                    }
                } else {
                    newDp[key] = size + 1
                }
            }
        }
        dp = newDp
    }
    maxVal := 0
    for _, v := range dp {
        if v > maxVal {
            maxVal = v
        }
    }
    return maxVal
}
