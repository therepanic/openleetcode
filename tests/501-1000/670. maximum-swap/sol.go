func maximumSwap(num int) int {
    numStr := strconv.Itoa(num)
    numList := []byte(numStr)
    lastIndex := make(map[int]int)
    for i, ch := range numList {
        lastIndex[int(ch-'0')] = i
    }
    for i, ch := range numList {
        d := int(ch - '0')
        for x := 9; x > d; x-- {
            if idx, ok := lastIndex[x]; ok && idx > i {
                numList[i], numList[idx] = numList[idx], numList[i]
                res, _ := strconv.Atoi(string(numList))
                return res
            }
        }
    }
    return num
}
