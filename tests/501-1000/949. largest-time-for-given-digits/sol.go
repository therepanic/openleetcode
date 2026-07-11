func largestTimeFromDigits(arr []int) string {
    var permList [][]int
    permute(arr, 0, &permList)
    
    bestTime := -1
    bestIdx := -1
    
    for i, perm := range permList {
        hours := perm[0]*10 + perm[1]
        minutes := perm[2]*10 + perm[3]
        
        if hours < 24 && minutes < 60 {
            currTime := hours*60 + minutes
            if currTime > bestTime {
                bestTime = currTime
                bestIdx = i
            }
        }
    }
    
    if bestIdx == -1 {
        return ""
    }
    
    res := permList[bestIdx]
    return fmt.Sprintf("%d%d:%d%d", res[0], res[1], res[2], res[3])
}

func permute(arr []int, start int, result *[][]int) {
    if start == len(arr) {
        perm := make([]int, len(arr))
        copy(perm, arr)
        *result = append(*result, perm)
        return
    }
    for i := start; i < len(arr); i++ {
        arr[start], arr[i] = arr[i], arr[start]
        permute(arr, start+1, result)
        arr[start], arr[i] = arr[i], arr[start]
    }
}
