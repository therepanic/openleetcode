func containVirus(isInfected [][]int) int {
    rows := len(isInfected)
    cols := len(isInfected[0])
    directions := [][2]int{{1, 0}, {-1, 0}, {0, 1}, {0, -1}}
    totalWalls := 0

    for {
        seen := make([][]bool, rows)
        for i := range seen {
            seen[i] = make([]bool, cols)
        }
        regions := make([][][2]int, 0)
        frontiers := make([]map[string]bool, 0)
        wallsNeeded := make([]int, 0)

        for r := 0; r < rows; r++ {
            for c := 0; c < cols; c++ {
                if isInfected[r][c] != 1 || seen[r][c] {
                    continue
                }
                stack := [][2]int{{r, c}}
                seen[r][c] = true
                region := make([][2]int, 0)
                frontier := make(map[string]bool)
                walls := 0
                for len(stack) > 0 {
                    cr, cc := stack[len(stack)-1][0], stack[len(stack)-1][1]
                    stack = stack[:len(stack)-1]
                    region = append(region, [2]int{cr, cc})
                    for _, d := range directions {
                        nr, nc := cr+d[0], cc+d[1]
                        if nr < 0 || nr >= rows || nc < 0 || nc >= cols {
                            continue
                        }
                        if isInfected[nr][nc] == 1 && !seen[nr][nc] {
                            seen[nr][nc] = true
                            stack = append(stack, [2]int{nr, nc})
                        } else if isInfected[nr][nc] == 0 {
                            walls++
                            key := string(rune(nr + '0')) + "," + string(rune(nc + '0'))
                            if _, ok := frontier[key]; !ok {
                                frontier[key] = true
                            }
                        }
                    }
                }

                // Convert map to proper set of strings for size comparison
                frontierSet := make(map[string]bool)
                for k := range frontier {
                    frontierSet[k] = true
                }
                regions = append(regions, region)
                frontiers = append(frontiers, frontierSet)
                wallsNeeded = append(wallsNeeded, walls)
            }
        }

        if len(regions) == 0 {
            break
        }

        target := 0
        for i := 1; i < len(frontiers); i++ {
            if len(frontiers[i]) > len(frontiers[target]) {
                target = i
            }
        }

        if len(frontiers[target]) == 0 {
            break
        }

        totalWalls += wallsNeeded[target]

        for _, cell := range regions[target] {
            isInfected[cell[0]][cell[1]] = -1
        }

        for i := range regions {
            if i == target {
                continue
            }
            for key := range frontiers[i] {
                // parse key "r,c"
                parts := []rune(key)
                comma := 0
                for idx, ch := range parts {
                    if ch == ',' {
                        comma = idx
                        break
                    }
                }
                nr := int(parts[0] - '0')
                nc := int(parts[comma+1] - '0')
                if nr >= 0 && nr < rows && nc >= 0 && nc < cols {
                    isInfected[nr][nc] = 1
                }
            }
        }
    }

    return totalWalls
}
