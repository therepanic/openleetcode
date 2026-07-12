func gridIllumination(n int, lamps [][]int, queries [][]int) []int {
    rowCount := make(map[int]int)
    colCount := make(map[int]int)
    diag1 := make(map[int]int)
    diag2 := make(map[int]int)
    lampSet := make(map[[2]int]bool)
    ans := make([]int, len(queries))
    dirs := [][2]int{{-1,-1}, {-1,0}, {-1,1}, {0,-1}, {0,0}, {0,1}, {1,-1}, {1,0}, {1,1}}
    
    for _, lamp := range lamps {
        r, c := lamp[0], lamp[1]
        key := [2]int{r, c}
        if !lampSet[key] {
            lampSet[key] = true
            rowCount[r]++
            colCount[c]++
            diag1[r - c]++
            diag2[r + c]++
        }
    }
    
    for i, q := range queries {
        r, c := q[0], q[1]
        if rowCount[r] > 0 || colCount[c] > 0 || diag1[r - c] > 0 || diag2[r + c] > 0 {
            ans[i] = 1
            for _, d := range dirs {
                nr, nc := r + d[0], c + d[1]
                key := [2]int{nr, nc}
                if lampSet[key] {
                    delete(lampSet, key)
                    rowCount[nr]--
                    colCount[nc]--
                    diag1[nr - nc]--
                    diag2[nr + nc]--
                }
            }
        } else {
            ans[i] = 0
        }
    }
    return ans
}
