func bestCoordinate(towers [][]int, radius int) []int {
    maxX := 0
    maxY := 0
    for _, t := range towers {
        if t[0] > maxX { maxX = t[0] }
        if t[1] > maxY { maxY = t[1] }
    }
    
    bestQuality := 0
    bestCoord := []int{0, 0}
    
    for x := 0; x <= maxX; x++ {
        for y := 0; y <= maxY; y++ {
            quality := 0
            for _, t := range towers {
                dx := float64(t[0] - x)
                dy := float64(t[1] - y)
                dist := math.Sqrt(dx*dx + dy*dy)
                if dist <= float64(radius) {
                    quality += int(float64(t[2]) / (1 + dist))
                }
            }
            if quality > bestQuality || (quality == bestQuality && (x < bestCoord[0] || (x == bestCoord[0] && y < bestCoord[1]))) {
                bestQuality = quality
                bestCoord[0] = x
                bestCoord[1] = y
            }
        }
    }
    
    return bestCoord
}
