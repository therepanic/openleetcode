func canBeEqual(target []int, arr []int) bool {
    counts := make([]int, 1001)
    
    for i := 0; i < len(target); i++ {
        counts[target[i]]++
        counts[arr[i]]--
    }
    
    for _, c := range counts {
        if c != 0 {
            return false
        }
    }
    return true
}
