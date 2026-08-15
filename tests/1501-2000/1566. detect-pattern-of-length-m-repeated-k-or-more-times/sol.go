func containsPattern(arr []int, m int, k int) bool {
    for i := 0; i <= len(arr) - m*k; i++ {
        match := true
        for j := 0; j < m*(k-1); j++ {
            if arr[i+j] != arr[i+j+m] {
                match = false
                break
            }
        }
        if match {
            return true
        }
    }
    return false
}
