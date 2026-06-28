func selfDividingNumbers(left int, right int) []int {
    lst := []int{}
    for i := left; i <= right; i++ {
        s := strconv.Itoa(i)
        hasZero := false
        for _, c := range s {
            if c == '0' {
                hasZero = true
                break
            }
        }
        if hasZero {
            continue
        }
        b := 1
        for _, c := range s {
            digit := int(c - '0')
            if i%digit != 0 {
                b = 0
                break
            }
        }
        if b == 1 {
            lst = append(lst, i)
        }
    }
    return lst
}
