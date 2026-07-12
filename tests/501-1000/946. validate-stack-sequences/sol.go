func validateStackSequences(pushed []int, popped []int) bool {
    st := []int{}
    j := 0
    for _, x := range pushed {
        st = append(st, x)
        for len(st) > 0 && j < len(popped) && st[len(st)-1] == popped[j] {
            st = st[:len(st)-1]
            j++
        }
    }
    return j == len(popped)
}
