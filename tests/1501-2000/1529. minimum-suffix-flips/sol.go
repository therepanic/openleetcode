func minFlips(target string) int {
    minCount := 0
    flag := 0
    n := len(target)
    
    for i := 0; i < n; i++ {
        expected := byte('0' + flag%2)
        if target[i] != expected {
            minCount++
            flag++
        }
    }
    
    return minCount
}
