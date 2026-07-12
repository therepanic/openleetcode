func pancakeSort(arr []int) []int {
    n := len(arr)
    result := []int{}
    
    for i := 0; i < n; i++ {
        target := n - i
        position := 0
        
        for j := 0; j < n - i; j++ {
            if arr[j] == target {
                position = j
                break
            }
        }
        
        if position == n - i - 1 {
            continue
        }
        
        if position > 0 {
            result = append(result, position + 1)
            reverse(arr, 0, position)
        }
        
        result = append(result, n - i)
        reverse(arr, 0, n - i - 1)
    }
    
    return result
}

func reverse(arr []int, left, right int) {
    for left < right {
        arr[left], arr[right] = arr[right], arr[left]
        left++
        right--
    }
}
