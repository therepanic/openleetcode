func nearestValidPoint(x int, y int, points [][]int) int {
    currentMinDistance := 20001
    currentMinIndex := -1
    for i, point := range points {
        a, b := point[0], point[1]
        if x == a || y == b {
            distance := abs(x-a) + abs(y-b)
            if distance < currentMinDistance {
                currentMinDistance = distance
                currentMinIndex = i
            }
        }
    }
    return currentMinIndex
}

func abs(a int) int {
    if a < 0 {
        return -a
    }
    return a
}
