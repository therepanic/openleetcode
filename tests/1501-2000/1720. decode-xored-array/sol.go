func decode(encoded []int, first int) []int {
    arr := make([]int, len(encoded)+1)
    arr[0] = first
    for i, e := range encoded {
        arr[i+1] = arr[i] ^ e
    }
    return arr
}
