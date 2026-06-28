func escapeGhosts(ghosts [][]int, target []int) bool {
    a := make([]int, len(ghosts))
    for i, ghost := range ghosts {
        a[i] = abs(ghost[0]-target[0]) + abs(ghost[1]-target[1])
    }
    
    z := abs(target[0]-0) + abs(target[1]-0)
    
    ans := true
    for _, v := range a {
        if v <= z {
            ans = false
        }
    }
    
    return ans
}

func abs(x int) int {
    if x < 0 {
        return -x
    }
    return x
}
