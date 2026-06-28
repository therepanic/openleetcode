func reachNumber(target int) int {
    target = abs(target)
    n := int((-1 + math.Sqrt(1.0 + 8.0 * float64(target))) / 2)
    a := n * (n + 1) / 2
    b := a + n + 1
    
    if a == target {
        return n
    }
    if (b - target) % 2 == 0 {
        return n + 1
    }
    if (n + 2) % 2 == 1 {
        return n + 2
    }
    return n + 3
}

func abs(x int) int {
    if x < 0 {
        return -x
    }
    return x
}
