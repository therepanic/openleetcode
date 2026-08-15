func maximumRemovals(s string, p string, removable []int) int {
    left, right := 0, len(removable)
    maxK := 0
    for left <= right {
        mid := (left + right) / 2
        removed := make([]bool, len(s))
        for i := 0; i < mid; i++ {
            removed[removable[i]] = true
        }
        j := 0
        for i := 0; i < len(s) && j < len(p); i++ {
            if !removed[i] && s[i] == p[j] {
                j++
            }
        }
        if j == len(p) {
            maxK = mid
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    return maxK
}
