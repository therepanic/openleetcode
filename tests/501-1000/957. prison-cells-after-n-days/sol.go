func prisonAfterNDays(cells []int, n int) []int {
    n = (n - 1) % 14 + 1
    for day := 0; day < n; day++ {
        prev := cells[0]
        for i := 1; i < len(cells) - 1; i++ {
            current := cells[i]
            if prev == cells[i + 1] {
                cells[i] = 1
            } else {
                cells[i] = 0
            }
            prev = current
        }
        cells[0] = 0
        cells[len(cells) - 1] = 0
    }
    return cells
}
