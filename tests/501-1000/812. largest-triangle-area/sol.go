func largestTriangleArea(points [][]int) float64 {
    maxArea := 0.0
    n := len(points)
    for i := 0; i < n; i++ {
        x1, y1 := points[i][0], points[i][1]
        for j := i; j < n; j++ {
            x2, y2 := points[j][0], points[j][1]
            for k := j; k < n; k++ {
                x3, y3 := points[k][0], points[k][1]
                area := math.Abs(0.5 * float64(x1 * (y2 - y3) + x2 * (y3 - y1) + x3 * (y1 - y2)))
                if area > maxArea {
                    maxArea = area
                }
            }
        }
    }
    return maxArea
}
