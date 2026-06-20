func maxPoints(points [][]int) int {
    if len(points) <= 2 {
        return len(points)
    }
    best := 0
    for i := 0; i < len(points); i++ {
        count := make(map[string]int)
        local := 0
        duplicates := 1
        x1, y1 := points[i][0], points[i][1]
        for j := i + 1; j < len(points); j++ {
            dx := points[j][0] - x1
            dy := points[j][1] - y1
            if dx == 0 && dy == 0 {
                duplicates++
                continue
            }
            g := gcd149(dx, dy)
            dx /= g
            dy /= g
            if dx < 0 {
                dx = -dx
                dy = -dy
            } else if dx == 0 {
                dy = 1
            } else if dy == 0 {
                dx = 1
            }
            key := fmt.Sprintf("%d/%d", dx, dy)
            count[key]++
            if count[key] > local {
                local = count[key]
            }
        }
        if local+duplicates > best {
            best = local + duplicates
        }
    }
    return best
}

func gcd149(a int, b int) int {
    if a < 0 {
        a = -a
    }
    if b < 0 {
        b = -b
    }
    for b != 0 {
        a, b = b, a%b
    }
    return a
}
