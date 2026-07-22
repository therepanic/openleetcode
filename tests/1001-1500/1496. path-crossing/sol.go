func isPathCrossing(path string) bool {
    set := make(map[string]bool)
    x, y := 0, 0
    set["0,0"] = true
    for _, c := range path {
        switch c {
        case 'N': y++
        case 'S': y--
        case 'E': x++
        case 'W': x--
        }
        point := fmt.Sprintf("%d,%d", x, y)
        if set[point] {
            return true
        }
        set[point] = true
    }
    return false
}
