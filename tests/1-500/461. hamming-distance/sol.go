func hammingDistance(x int, y int) int {
    count := 0
    if x == y {
        return count
    }
    for x > 0 || y > 0 {
        x_bit := 0
        y_bit := 0
        if x > 0 {
            x_bit = x % 2
            x = x / 2
        }
        if y > 0 {
            y_bit = y % 2
            y = y / 2
        }
        if x_bit != y_bit {
            count++
        }
    }
    return count
}
