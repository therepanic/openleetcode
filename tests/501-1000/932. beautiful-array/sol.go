func beautifulArray(n int) []int {
    if n == 1 {
        return []int{1}
    }
    
    left := beautifulArray((n + 1) / 2)
    right := beautifulArray(n / 2)
    
    result := make([]int, 0, n)
    
    for _, x := range left {
        result = append(result, 2*x-1)
    }
    for _, x := range right {
        result = append(result, 2*x)
    }
    
    return result
}
