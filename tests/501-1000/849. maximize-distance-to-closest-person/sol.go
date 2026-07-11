func maxDistToClosest(seats []int) int {
    sb := ""
    for _, s := range seats {
        sb += string(rune('0' + s))
    }
    parts := strings.Split(sb, "1")
    maxVal := 0
    for _, p := range parts {
        if len(p) > maxVal {
            maxVal = len(p)
        }
    }
    first := len(parts[0])
    last := len(parts[len(parts)-1])
    mid := (maxVal + 1) / 2
    if first > mid {
        mid = first
    }
    if last > mid {
        mid = last
    }
    return mid
}
