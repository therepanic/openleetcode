func isRectangleCover(rectangles [][]int) bool {
    area := 0
    corners := make(map[string]bool)
    
    for _, rect := range rectangles {
        x, y, X, Y := rect[0], rect[1], rect[2], rect[3]
        area += (X - x) * (Y - y)
        
        points := []string{
            fmt.Sprintf("%d,%d", x, y),
            fmt.Sprintf("%d,%d", x, Y),
            fmt.Sprintf("%d,%d", X, y),
            fmt.Sprintf("%d,%d", X, Y),
        }
        
        for _, p := range points {
            if corners[p] {
                delete(corners, p)
            } else {
                corners[p] = true
            }
        }
    }
    
    if len(corners) != 4 {
        return false
    }
    
    minX, minY := int(^uint(0)>>1), int(^uint(0)>>1)
    maxX, maxY := -minX-1, -minY-1
    
    for point := range corners {
        var x, y int
        fmt.Sscanf(point, "%d,%d", &x, &y)
        if x < minX { minX = x }
        if y < minY { minY = y }
        if x > maxX { maxX = x }
        if y > maxY { maxY = y }
    }
    
    return (maxX - minX) * (maxY - minY) == area
}
