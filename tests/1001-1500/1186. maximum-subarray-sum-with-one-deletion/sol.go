func maximumSum(arr []int) int {
    n := len(arr)
    if n == 1 {
        return arr[0]
    }
    
    maxNoDelete := arr[0]
    maxOneDelete := arr[0]
    result := arr[0]
    
    for i := 1; i < n; i++ {
        prevNoDelete := maxNoDelete
        maxNoDelete = max(maxNoDelete + arr[i], arr[i])
        maxOneDelete = max(maxOneDelete + arr[i], prevNoDelete)
        result = max(result, max(maxNoDelete, maxOneDelete))
    }
    
    return result
}

func max(a, b int) int {
    if a > b {
        return a
    }
    return b
}
