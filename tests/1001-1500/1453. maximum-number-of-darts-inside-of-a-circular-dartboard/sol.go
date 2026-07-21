func numPoints(darts [][]int, r int) int {
    ans := 1
    radius := float64(r)
    radiusSq := radius * radius
    for i := 0; i < len(darts); i++ {
        x1, y1 := float64(darts[i][0]), float64(darts[i][1])
        for j := i + 1; j < len(darts); j++ {
            x2, y2 := float64(darts[j][0]), float64(darts[j][1])
            dx, dy := x2-x1, y2-y1
            distanceSq := dx*dx + dy*dy
            if distanceSq > 4.0*radiusSq {
                continue
            }
            distance := math.Sqrt(distanceSq)
            midpointX, midpointY := (x1+x2)/2.0, (y1+y2)/2.0
            offset := math.Sqrt(math.Max(0.0, radiusSq-distanceSq/4.0))
            normalX, normalY := -dy/distance, dx/distance
            for _, sign := range []float64{-1.0, 1.0} {
                centerX := midpointX + sign*offset*normalX
                centerY := midpointY + sign*offset*normalY
                count := 0
                for _, dart := range darts {
                    ex := float64(dart[0]) - centerX
                    ey := float64(dart[1]) - centerY
                    if ex*ex+ey*ey <= radiusSq+1e-9 {
                        count++
                    }
                }
                if count > ans {
                    ans = count
                }
            }
        }
    }
    return ans
}
