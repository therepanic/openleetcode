func minimumAbsDifference(arr []int) [][]int {
    sort.Ints(arr)
    minDiff := math.MaxInt32
    for i := 1; i < len(arr); i++ {
        diff := arr[i] - arr[i-1]
        if diff < minDiff {
            minDiff = diff
        }
    }
    var result [][]int
    for i := 1; i < len(arr); i++ {
        if arr[i] - arr[i-1] == minDiff {
            result = append(result, []int{arr[i-1], arr[i]})
        }
    }
    return result
}
