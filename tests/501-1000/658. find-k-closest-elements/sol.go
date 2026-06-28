func findClosestElements(arr []int, k int, x int) []int {
    sorted := make([]int, len(arr))
    copy(sorted, arr)
    sort.Slice(sorted, func(i, j int) bool {
        di, dj := abs(sorted[i]-x), abs(sorted[j]-x)
        if di != dj {
            return di < dj
        }
        return sorted[i] < sorted[j]
    })
    result := make([]int, k)
    copy(result, sorted[:k])
    sort.Ints(result)
    return result
}

func abs(a int) int {
    if a < 0 {
        return -a
    }
    return a
}
