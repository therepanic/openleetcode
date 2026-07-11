func numMovesStones(a int, b int, c int) []int {
    stones := []int{a, b, c}
    sort.Ints(stones)
    x, y, z := stones[0], stones[1], stones[2]
    minMove := 0
    if z-x == 2 {
        minMove = 0
    } else if y-x <= 2 || z-y <= 2 {
        minMove = 1
    } else {
        minMove = 2
    }
    maxMove := z - x - 2
    return []int{minMove, maxMove}
}
