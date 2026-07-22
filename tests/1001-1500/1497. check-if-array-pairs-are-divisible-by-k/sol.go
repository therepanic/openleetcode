func canArrange(arr []int, k int) bool {
    a := make([]int, len(arr))
    for i, v := range arr {
        a[i] = ((v % k) + k) % k
    }
    sort.Ints(a)
    j := 0
    for j < len(a) && a[j] == 0 {
        j++
    }
    if j%2 != 0 {
        return false
    }
    b := a[j:]
    for l, r := 0, len(b)-1; l < r; l, r = l+1, r-1 {
        if (b[l]+b[r])%k != 0 {
            return false
        }
    }
    return true
}
