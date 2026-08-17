func trimMean(arr []int) float64 {
    n := len(arr)
    per5 := int(0.05 * float64(n))
    sort.Ints(arr)
    sum := 0
    for i := per5; i < n-per5; i++ {
        sum += arr[i]
    }
    return float64(sum) / float64(n-per5-per5)
}
