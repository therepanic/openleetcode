func canReorderDoubled(arr []int) bool {
    freq := make(map[int]int)
    for _, v := range arr {
        freq[v]++
    }
    
    sort.Slice(arr, func(i, j int) bool {
        return abs(arr[i]) < abs(arr[j])
    })
    
    for _, val := range arr {
        if freq[val] == 0 {
            continue
        }
        target := val * 2
        if count, ok := freq[target]; ok && count > 0 {
            freq[val]--
            freq[target]--
        } else {
            return false
        }
    }
    return true
}

func abs(x int) int {
    if x < 0 {
        return -x
    }
    return x
}
