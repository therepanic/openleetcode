func maximumElementAfterDecrementingAndRearranging(arr []int) int {
    sort.Ints(arr)
    arr[0] = 1
    for i := 1; i < len(arr); i++ {
        if arr[i] > arr[i-1]+1 {
            arr[i] = arr[i-1] + 1
        }
    }
    return arr[len(arr)-1]
}
