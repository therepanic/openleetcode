func getMinSwaps(num string, k int) int {
    arr := []byte(num)
    target := []byte(num)
    
    for i := 0; i < k; i++ {
        nextPermutation(target)
    }
    
    swaps := 0
    arr = []byte(num)
    
    for i := 0; i < len(arr); i++ {
        if arr[i] == target[i] {
            continue
        }
        
        j := i
        for arr[j] != target[i] {
            j++
        }
        
        for j > i {
            arr[j], arr[j-1] = arr[j-1], arr[j]
            j--
            swaps++
        }
    }
    
    return swaps
}

func nextPermutation(arr []byte) {
    i := len(arr) - 2
    for i >= 0 && arr[i] >= arr[i+1] {
        i--
    }
    if i == -1 {
        return
    }
    
    j := len(arr) - 1
    for arr[j] <= arr[i] {
        j--
    }
    
    arr[i], arr[j] = arr[j], arr[i]
    
    left, right := i+1, len(arr)-1
    for left < right {
        arr[left], arr[right] = arr[right], arr[left]
        left++
        right--
    }
}
