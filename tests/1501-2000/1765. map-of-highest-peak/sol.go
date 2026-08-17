func highestPeak(isWater [][]int) [][]int {
    r := len(isWater)
    c := len(isWater[0])
    height := make([][]int, r)
    inf := 1000000000
    for i := 0; i < r; i++ {
        height[i] = make([]int, c)
        for j := 0; j < c; j++ {
            height[i][j] = inf
        }
    }

    for i := 0; i < r; i++ {
        for j := 0; j < c; j++ {
            if isWater[i][j] == 1 {
                height[i][j] = 0
            } else {
                if i > 0 && height[i-1][j]+1 < height[i][j] {
                    height[i][j] = height[i-1][j] + 1
                }
                if j > 0 && height[i][j-1]+1 < height[i][j] {
                    height[i][j] = height[i][j-1] + 1
                }
            }
        }
    }

    for i := r - 1; i >= 0; i-- {
        for j := c - 1; j >= 0; j-- {
            if i < r-1 && height[i+1][j]+1 < height[i][j] {
                height[i][j] = height[i+1][j] + 1
            }
            if j < c-1 && height[i][j+1]+1 < height[i][j] {
                height[i][j] = height[i][j+1] + 1
            }
        }
    }

    return height
}
