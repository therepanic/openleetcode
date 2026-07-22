func findMaxValueOfEquation(points [][]int, k int) int {
    type pair struct {
        value int
        x     int
    }
    window := make([]pair, 0)
    answer := -1 << 60
    for _, point := range points {
        x, y := point[0], point[1]
        for len(window) > 0 && x - window[0].x > k {
            window = window[1:]
        }
        if len(window) > 0 {
            if x + y + window[0].value > answer {
                answer = x + y + window[0].value
            }
        }
        value := y - x
        for len(window) > 0 && window[len(window)-1].value <= value {
            window = window[:len(window)-1]
        }
        window = append(window, pair{value, x})
    }
    return answer
}
