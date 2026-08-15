func minSwaps(s string) int {
    swap := 0
    for _, c := range s {
        if c == '[' {
            swap++
        } else {
            if swap > 0 {
                swap--
            }
        }
    }
    return (swap + 1) / 2
}
