func checkMove(board [][]byte, rMove int, cMove int, color byte) bool {
    opposite := byte('W')
    if color == 'W' {
        opposite = 'B'
    }
    dirs := [][2]int{{-1,-1},{-1,0},{-1,1},{0,-1},{0,1},{1,-1},{1,0},{1,1}}

    for _, d := range dirs {
        r := rMove + d[0]
        c := cMove + d[1]
        cnt := 0

        for r >= 0 && r < 8 && c >= 0 && c < 8 && board[r][c] == opposite {
            r += d[0]
            c += d[1]
            cnt++
        }

        if cnt >= 1 && r >= 0 && r < 8 && c >= 0 && c < 8 && board[r][c] == color {
            return true
        }
    }

    return false
}
