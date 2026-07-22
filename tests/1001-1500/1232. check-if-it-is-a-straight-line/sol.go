func checkStraightLine(coordinates [][]int) bool {
    x1, y1 := coordinates[0][0], coordinates[0][1]
    x2, y2 := coordinates[1][0], coordinates[1][1]
    
    var slope float64
    if x2 == x1 {
        slope = float64(1<<63 - 1) // infinity-like
    } else {
        slope = float64(y2 - y1) / float64(x2 - x1)
    }
    
    n := len(coordinates)
    for i := 1; i < n - 1; i++ {
        x1, y1 = coordinates[i][0], coordinates[i][1]
        x2, y2 = coordinates[i+1][0], coordinates[i+1][1]
        
        var currSlope float64
        if x2 == x1 {
            currSlope = float64(1<<63 - 1)
        } else {
            currSlope = float64(y2 - y1) / float64(x2 - x1)
        }
        
        if currSlope != slope {
            return false
        }
    }
    
    return true
}
