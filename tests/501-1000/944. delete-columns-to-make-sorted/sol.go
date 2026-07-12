func minDeletionSize(strs []string) int {
    rows := len(strs)
    cols := len(strs[0])
    deletions := 0

    for c := 0; c < cols; c++ {
        for r := 0; r < rows-1; r++ {
            if strs[r][c] > strs[r+1][c] {
                deletions++
                break
            }
        }
    }

    return deletions
}
