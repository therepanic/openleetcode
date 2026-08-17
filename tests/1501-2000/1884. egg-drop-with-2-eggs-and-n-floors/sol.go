func twoEggDrop(n int) int {
    l, r := 1, n
    res := 0
    for l <= r {
        moves := (l + r) / 2
        if (1+moves)*moves/2 >= n {
            res = moves
            r = moves - 1
        } else {
            l = moves + 1
        }
    }
    return res
}
