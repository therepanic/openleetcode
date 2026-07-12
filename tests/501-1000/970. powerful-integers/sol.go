func powerfulIntegers(x int, y int, bound int) []int {
    result := make(map[int]bool)
    i := 1

    for i <= bound {
        j := 1
        for i+j <= bound {
            result[i+j] = true
            if y == 1 {
                break
            }
            j *= y
        }
        if x == 1 {
            break
        }
        i *= x
    }
    
    res := make([]int, 0, len(result))
    for k := range result {
        res = append(res, k)
    }
    return res
}
