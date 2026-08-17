func visiblePoints(points [][]int, angle int, location []int) int {
    angles := []float64{}
    same := 0
    x0, y0 := location[0], location[1]
    
    for _, p := range points {
        dx := p[0] - x0
        dy := p[1] - y0
        if dx == 0 && dy == 0 {
            same++
            continue
        }
        ang := math.Atan2(float64(dy), float64(dx)) * 180.0 / math.Pi
        angles = append(angles, ang)
    }
    
    if len(angles) == 0 {
        return same
    }
    
    sort.Float64s(angles)
    n := len(angles)
    full := make([]float64, 0, 2*n)
    full = append(full, angles...)
    for _, a := range angles {
        full = append(full, a+360)
    }
    
    maxVis := 0
    j := 0
    for i := 0; i < n; i++ {
        for j < len(full) && full[j]-full[i] <= float64(angle) {
            j++
        }
        if j-i > maxVis {
            maxVis = j - i
        }
    }
    
    return maxVis + same
}
