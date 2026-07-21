func getStrongest(arr []int, k int) []int {
    sort.Ints(arr)
    m := arr[(len(arr)-1)/2]
    
    left, right := 0, len(arr)-1
    result := make([]int, k)
    for i := 0; i < k; i++ {
        if abs(arr[right]-m) >= abs(arr[left]-m) {
            result[i] = arr[right]
            right--
        } else {
            result[i] = arr[left]
            left++
        }
    }
    return result
}

func abs(x int) int {
    if x < 0 {
        return -x
    }
    return x
}
