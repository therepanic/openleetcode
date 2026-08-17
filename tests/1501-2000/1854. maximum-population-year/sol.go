func maximumPopulation(logs [][]int) int {
    l := len(logs)
    a := make([]int, l)
    r := 0
    y := 0
    for i := 0; i < l; i++ {
        a[i] = logs[i][0]
    }
    for j := 0; j < l; j++ {
        c := 0
        for k := 0; k < l; k++ {
            if a[j] >= logs[k][0] && a[j] < logs[k][1] && j != k {
                c++
            }
        }
        if c > r {
            r = c
            y = a[j]
        }
        if c == r && r > 0 {
            if a[j] < y {
                y = a[j]
            }
        }
    }
    if y == 0 {
        min := a[0]
        for i := 1; i < l; i++ {
            if a[i] < min {
                min = a[i]
            }
        }
        return min
    }
    return y
}
