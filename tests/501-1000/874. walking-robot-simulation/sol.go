func robotSim(commands []int, obstacles [][]int) int {
    blocked := make(map[[2]int]bool)
    for _, o := range obstacles {
        blocked[[2]int{o[0], o[1]}] = true
    }

    directions := [][2]int{
        {0, 1}, {1, 0}, {0, -1}, {-1, 0},
    }

    x, y := 0, 0
    dir := 0
    maxDist := 0

    for _, cmd := range commands {
        if cmd == -1 {
            dir = (dir + 1) % 4
        } else if cmd == -2 {
            dir = (dir + 3) % 4
        } else {
            for cmd > 0 {
                nx := x + directions[dir][0]
                ny := y + directions[dir][1]

                if blocked[[2]int{nx, ny}] {
                    break
                }

                x = nx
                y = ny

                dist := x*x + y*y
                if dist > maxDist {
                    maxDist = dist
                }
                cmd--
            }
        }
    }

    return maxDist
}
