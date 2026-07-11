func minAreaFreeRect(points [][]int) float64 {
    ans := math.MaxFloat64
    seen := make(map[string][][2]int)
    n := len(points)
    for i := 0; i < n; i++ {
        x0, y0 := points[i][0], points[i][1]
        for j := i + 1; j < n; j++ {
            x1, y1 := points[j][0], points[j][1]
            cx := float64(x0+x1) / 2.0
            cy := float64(y0+y1) / 2.0
            d2 := int64(x0-x1)*int64(x0-x1) + int64(y0-y1)*int64(y0-y1)
            key := fmt.Sprintf("%f,%f,%d", cx, cy, d2)
            if list, ok := seen[key]; ok {
                for _, prev := range list {
                    xx, yy := prev[0], prev[1]
                    area := math.Sqrt(float64((x0-xx)*(x0-xx)+(y0-yy)*(y0-yy)) * float64((x1-xx)*(x1-xx)+(y1-yy)*(y1-yy)))
                    if area < ans {
                        ans = area
                    }
                }
            }
            seen[key] = append(seen[key], [2]int{x0, y0})
        }
    }
    if ans == math.MaxFloat64 {
        return 0.0
    }
    return ans
}
