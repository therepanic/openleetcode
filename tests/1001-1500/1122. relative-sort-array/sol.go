func relativeSortArray(arr1 []int, arr2 []int) []int {
    freq := make([]int, 1001)
    for _, num := range arr1 {
        freq[num]++
    }
    idx := 0
    for _, num := range arr2 {
        for freq[num] > 0 {
            arr1[idx] = num
            idx++
            freq[num]--
        }
    }
    for num := 0; num < 1001; num++ {
        for freq[num] > 0 {
            arr1[idx] = num
            idx++
            freq[num]--
        }
    }
    return arr1
}
