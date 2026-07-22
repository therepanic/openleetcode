func getMinDistSum(positions [][]int) float64 {
    distSum := func(x, y float64) float64 {
        sum := 0.0
        for _, p := range positions {
            dx := x - float64(p[0])
            dy := y - float64(p[1])
            sum += math.Sqrt(dx*dx + dy*dy)
        }
        return sum
    }
    
    x, y := 0.0, 0.0
    for _, p := range positions {
        x += float64(p[0])
        y += float64(p[1])
    }
    x /= float64(len(positions))
    y /= float64(len(positions))
    
    ans := distSum(x, y)
    chg := 100.0
    dirs := [][]int{{-1, 0}, {0, -1}, {0, 1}, {1, 0}}
    
    for chg > 1e-6 {
        zoom := true
        for _, d := range dirs {
            xx := x + chg*float64(d[0])
            yy := y + chg*float64(d[1])
            dd := distSum(xx, yy)
            if dd < ans {
                ans = dd
                x, y = xx, yy
                zoom = false
                break
            }
        }
        if zoom {
            chg /= 2
        }
    }
    return ans
}
