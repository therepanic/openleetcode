func minAreaRect(points [][]int) int {
    cols := make(map[int][]int)
    for _, point := range points {
        x, y := point[0], point[1]
        cols[x] = append(cols[x], y)
    }
    
    lastX := make(map[string]int)
    best := int(^uint(0) >> 1)
    
    sortedX := make([]int, 0, len(cols))
    for x := range cols {
        sortedX = append(sortedX, x)
    }
    sort.Ints(sortedX)
    
    for _, x := range sortedX {
        ys := cols[x]
        sort.Ints(ys)
        for i := 0; i < len(ys); i++ {
            for j := i + 1; j < len(ys); j++ {
                pair := fmt.Sprintf("%d,%d", ys[i], ys[j])
                if prevX, ok := lastX[pair]; ok {
                    area := (x - prevX) * (ys[j] - ys[i])
                    if area < best {
                        best = area
                    }
                }
                lastX[pair] = x
            }
        }
    }
    if best == int(^uint(0)>>1) {
        return 0
    }
    return best
}
