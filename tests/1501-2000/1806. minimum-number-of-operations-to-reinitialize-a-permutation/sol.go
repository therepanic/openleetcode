func reinitializePermutation(n int) int {
    original := make([]int, n)
    for i := 0; i < n; i++ {
        original[i] = i
    }
    permut := make([]int, n)
    copy(permut, original)
    arr := make([]int, n)
    count := 0
    for {
        for i := 0; i < n; i++ {
            if i%2 == 0 {
                arr[i] = permut[i/2]
            } else {
                arr[i] = permut[n/2+(i-1)/2]
            }
        }
        copy(permut, arr)
        count++
        equal := true
        for i := 0; i < n; i++ {
            if permut[i] != original[i] {
                equal = false
                break
            }
        }
        if equal {
            break
        }
    }
    return count
}
