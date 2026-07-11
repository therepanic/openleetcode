func champagneTower(poured int, query_row int, query_glass int) float64 {
    tower := make([][]float64, 102)
    for i := range tower {
        tower[i] = make([]float64, 102)
    }
    tower[0][0] = float64(poured)
    
    for r := 0; r <= query_row; r++ {
        for c := 0; c <= r; c++ {
            if tower[r][c] > 1 {
                excess := (tower[r][c] - 1.0) / 2.0
                tower[r][c] = 1
                tower[r+1][c] += excess
                tower[r+1][c+1] += excess
            }
        }
    }
    
    return tower[query_row][query_glass]
}
