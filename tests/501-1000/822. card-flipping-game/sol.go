func flipgame(fronts []int, backs []int) int {
    bad := make(map[int]bool)
    for i := 0; i < len(fronts); i++ {
        if fronts[i] == backs[i] {
            bad[fronts[i]] = true
        }
    }
    best := 2001
    for i := 0; i < len(fronts); i++ {
        if !bad[fronts[i]] && fronts[i] < best {
            best = fronts[i]
        }
        if !bad[backs[i]] && backs[i] < best {
            best = backs[i]
        }
    }
    if best <= 2000 {
        return best
    }
    return 0
}
