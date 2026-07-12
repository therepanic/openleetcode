func numTilePossibilities(tiles string) int {
    arr := []byte(tiles)
    sort.Slice(arr, func(i, j int) bool { return arr[i] < arr[j] })
    used := make([]bool, len(arr))
    return backtrack(arr, used)
}

func backtrack(tiles []byte, used []bool) int {
    count := 0
    for i := 0; i < len(tiles); i++ {
        if used[i] || (i > 0 && tiles[i] == tiles[i-1] && !used[i-1]) {
            continue
        }
        used[i] = true
        count += 1 + backtrack(tiles, used)
        used[i] = false
    }
    return count
}
