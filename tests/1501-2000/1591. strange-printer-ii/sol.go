func isPrintable(targetGrid [][]int) bool {
    m, n := len(targetGrid), len(targetGrid[0])
    colors := make(map[int][][2]int)
    for i := 0; i < m; i++ {
        for j := 0; j < n; j++ {
            colors[targetGrid[i][j]] = append(colors[targetGrid[i][j]], [2]int{i, j})
        }
    }
    
    canRemove := func(color int) bool {
        pos := colors[color]
        mnR, mxR := pos[0][0], pos[0][0]
        mnC, mxC := pos[0][1], pos[0][1]
        for _, p := range pos {
            if p[0] < mnR { mnR = p[0] }
            if p[0] > mxR { mxR = p[0] }
            if p[1] < mnC { mnC = p[1] }
            if p[1] > mxC { mxC = p[1] }
        }
        for i := mnR; i <= mxR; i++ {
            for j := mnC; j <= mxC; j++ {
                if targetGrid[i][j] != color && targetGrid[i][j] > 0 {
                    return false
                }
            }
        }
        for i := mnR; i <= mxR; i++ {
            for j := mnC; j <= mxC; j++ {
                targetGrid[i][j] = 0
            }
        }
        return true
    }
    
    colorSet := make(map[int]bool)
    for c := range colors {
        colorSet[c] = true
    }
    
    for len(colorSet) > 0 {
        removable := make([]int, 0)
        for c := range colorSet {
            if canRemove(c) {
                removable = append(removable, c)
            }
        }
        if len(removable) == 0 { return false }
        for _, c := range removable {
            delete(colorSet, c)
        }
    }
    return true
}
