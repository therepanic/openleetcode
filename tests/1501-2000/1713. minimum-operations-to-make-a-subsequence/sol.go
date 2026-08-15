func minOperations(target []int, arr []int) int {
    targetIndexMap := make(map[int]int)
    for i, num := range target {
        targetIndexMap[num] = i
    }
    
    transformedArr := []int{}
    for _, num := range arr {
        if idx, ok := targetIndexMap[num]; ok {
            transformedArr = append(transformedArr, idx)
        }
    }
    
    lis := []int{}
    for _, index := range transformedArr {
        pos := sort.SearchInts(lis, index)
        if pos == len(lis) {
            lis = append(lis, index)
        } else {
            lis[pos] = index
        }
    }
    
    return len(target) - len(lis)
}
