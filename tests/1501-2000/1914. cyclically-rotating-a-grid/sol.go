func rotateGrid(grid [][]int, k int) [][]int {

    t, l := 0, 0

    b, r := len(grid)-1, len(grid[0])-1

    for t < b && l < r {

        ln := b - t

        wid := r - l

        perimeter := 2*ln + 2*wid

        steps := k % perimeter

        for steps > 0 {

            tmp := grid[t][l]

            for i := l; i < r; i++ {

                grid[t][i] = grid[t][i+1]

            }

            for i := t; i < b; i++ {

                grid[i][r] = grid[i+1][r]

            }

            for i := r; i > l; i-- {

                grid[b][i] = grid[b][i-1]

            }

            for i := b; i > t; i-- {

                grid[i][l] = grid[i-1][l]

            }

            grid[t+1][l] = tmp

            steps--

        }

        t++

        l++

        b--

        r--

    }

    return grid

}
