func findMinMoves(machines []int) int {
    n := len(machines)
    total := 0
    for _, m := range machines {
        total += m
    }
    if total % n != 0 {
        return -1
    }
    avg := total / n
    imbalances := make([]int, n)
    for i, m := range machines {
        imbalances[i] = m - avg
    }
    res := 0
    d := 0
    for _, imb := range imbalances {
        if abs(d) > res {
            res = abs(d)
        }
        if imb > res {
            res = imb
        }
        d += imb
    }
    return res
}

func abs(x int) int {
    if x < 0 {
        return -x
    }
    return x
}
