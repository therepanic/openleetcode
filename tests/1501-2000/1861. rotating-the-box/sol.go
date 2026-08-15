func rotateTheBox(boxGrid [][]byte) [][]byte {
    r := len(boxGrid)
    c := len(boxGrid[0])
    rotate := make([][]byte, c)
    for i := range rotate {
        rotate[i] = make([]byte, r)
        for j := range rotate[i] {
            rotate[i][j] = '.'
        }
    }
    for i := 0; i < r; i++ {
        bottom := c - 1
        for j := c - 1; j >= 0; j-- {
            if boxGrid[i][j] == '#' {
                rotate[bottom][r-1-i] = '#'
                bottom--
            } else if boxGrid[i][j] == '*' {
                rotate[j][r-1-i] = '*'
                bottom = j - 1
            }
        }
    }
    return rotate
}
