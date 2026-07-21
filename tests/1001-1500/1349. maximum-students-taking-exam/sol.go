func maxStudents(seats [][]byte) int {
    m := len(seats)
    n := len(seats[0])
    available := make([]int, m)
    for i := 0; i < m; i++ {
        mask := 0
        for j := 0; j < n; j++ {
            if seats[i][j] == '.' {
                mask |= 1 << j
            }
        }
        available[i] = mask
    }

    var validMasks []int
    for mask := 0; mask < (1 << n); mask++ {
        if mask&(mask<<1) == 0 {
            validMasks = append(validMasks, mask)
        }
    }

    dp := map[int]int{0: 0}
    for row := 0; row < m; row++ {
        nextDp := map[int]int{}
        for _, current := range validMasks {
            if current & ^available[row] != 0 {
                continue
            }
            count := bits.OnesCount(uint(current))
            for previous, total := range dp {
                if current&((previous<<1)|(previous>>1)) != 0 {
                    continue
                }
                if val, ok := nextDp[current]; ok {
                    nextDp[current] = max(val, total+count)
                } else {
                    nextDp[current] = total + count
                }
            }
        }
        dp = nextDp
    }

    maxVal := 0
    for _, val := range dp {
        if val > maxVal {
            maxVal = val
        }
    }
    return maxVal
}

func max(a, b int) int {
    if a > b {
        return a
    }
    return b
}
