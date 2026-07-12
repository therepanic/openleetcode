func addToArrayForm(num []int, k int) []int {
    out := []int{}
    i := len(num) - 1
    for i >= 0 || k > 0 {
        if i >= 0 {
            k += num[i]
            i--
        }
        out = append(out, k%10)
        k /= 10
    }
    if len(out) == 0 {
        return []int{0}
    }
    for l, r := 0, len(out)-1; l < r; l, r = l+1, r-1 {
        out[l], out[r] = out[r], out[l]
    }
    return out
}
