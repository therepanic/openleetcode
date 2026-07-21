func arrayRankTransform(arr []int) []int {
    s := make([]int, len(arr))
    copy(s, arr)
    sort.Ints(s)
    unique := []int{}
    for _, x := range s {
        if len(unique) == 0 || unique[len(unique)-1] != x {
            unique = append(unique, x)
        }
    }
    for i := 0; i < len(arr); i++ {
        arr[i] = bisectLeft(unique, arr[i]) + 1
    }
    return arr
}

func bisectLeft(a []int, x int) int {
    lo, hi := 0, len(a)
    for lo < hi {
        mid := (lo + hi) / 2
        if a[mid] < x {
            lo = mid + 1
        } else {
            hi = mid
        }
    }
    return lo
}
