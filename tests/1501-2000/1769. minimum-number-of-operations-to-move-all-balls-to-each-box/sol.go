func minOperations(boxes string) []int {
    n := len(boxes)
    distances := make([]int, n)
    
    prefixCount := 0
    prefixSum := 0
    
    for i := 0; i < n; i++ {
        distances[i] = prefixCount*i - prefixSum
        if boxes[i] == '1' {
            prefixCount++
            prefixSum += i
        }
    }
    
    suffixCount := 0
    suffixSum := 0
    
    for i := n - 1; i >= 0; i-- {
        distances[i] += suffixSum - suffixCount*i
        if boxes[i] == '1' {
            suffixCount++
            suffixSum += i
        }
    }
    
    return distances
}
