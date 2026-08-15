func closestRoom(rooms [][]int, queries [][]int) []int {
    // sort rooms descending by size
    sort.Slice(rooms, func(i, j int) bool {
        return rooms[i][1] > rooms[j][1]
    })

    // sort query indices descending by minimum size
    idx := make([]int, len(queries))
    for i := range idx {
        idx[i] = i
    }
    sort.Slice(idx, func(i, j int) bool {
        return queries[idx[i]][1] > queries[idx[j]][1]
    })

    active := []int{}
    result := make([]int, len(queries))
    for i := range result {
        result[i] = -1
    }
    roomPtr := 0

    for _, qi := range idx {
        preferred := queries[qi][0]
        minimum := queries[qi][1]

        for roomPtr < len(rooms) && rooms[roomPtr][1] >= minimum {
            // insert into sorted order
            id := rooms[roomPtr][0]
            // binary search insertion position
            pos := sort.SearchInts(active, id)
            active = append(active, 0)
            copy(active[pos+1:], active[pos:])
            active[pos] = id
            roomPtr++
        }

        // binary search for preferred
        pos := sort.SearchInts(active, preferred)
        candidates := []int{}
        if pos < len(active) {
            candidates = append(candidates, active[pos])
        }
        if pos > 0 {
            candidates = append(candidates, active[pos-1])
        }

        if len(candidates) > 0 {
            best := candidates[0]
            for _, id := range candidates[1:] {
                if abs(id-preferred) < abs(best-preferred) ||
                   (abs(id-preferred) == abs(best-preferred) && id < best) {
                    best = id
                }
            }
            result[qi] = best
        }
    }
    return result
}

func abs(x int) int {
    if x < 0 {
        return -x
    }
    return x
}
