func reverseStr(s string, k int) string {
    arr := []byte(s)
    step := 2 * k
    for i := 0; i < len(arr); i += step {
        start := i
        end := i + k - 1
        if end >= len(arr) {
            end = len(arr) - 1
        }
        for start < end {
            arr[start], arr[end] = arr[end], arr[start]
            start++
            end--
        }
    }
    return string(arr)
}
