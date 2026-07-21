func findTheDistanceValue(arr1 []int, arr2 []int, d int) int {
    sort.Ints(arr2)
    count := 0
    for _, num := range arr1 {
        leftIndex := sort.SearchInts(arr2, num-d)
        rightIndex := sort.SearchInts(arr2, num+d+1)
        if leftIndex == rightIndex {
            count++
        }
    }
    return count
}
