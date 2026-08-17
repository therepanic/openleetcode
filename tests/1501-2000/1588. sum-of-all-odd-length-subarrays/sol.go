func sumOddLengthSubarrays(arr []int) int {
    s := 0
    for _, x := range arr {
        s += x
    }
    l := len(arr) - 1
    i := 2
    for l >= i {
        j := 0
        e := i
        for e <= l {
            for k := j; k <= e; k++ {
                s += arr[k]
            }
            j++
            e++
        }
        i += 2
    }
    return s
}
