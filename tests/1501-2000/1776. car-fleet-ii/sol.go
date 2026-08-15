func getCollisionTimes(cars [][]int) []float64 {
    n := len(cars)
    rightGreater := make([]int, n)
    for i := range rightGreater {
        rightGreater[i] = -1
    }
    ans := make([]float64, n)
    for i := range ans {
        ans[i] = -1.0
    }
    stack := []int{}
    for r := n - 1; r >= 0; r-- {
        for len(stack) > 0 && cars[stack[len(stack)-1]][1] >= cars[r][1] {
            stack = stack[:len(stack)-1]
        }
        if len(stack) > 0 {
            rightGreater[r] = stack[len(stack)-1]
        }
        stack = append(stack, r)
    }
    for r := n - 1; r >= 0; r-- {
        collideId := rightGreater[r]
        for collideId != -1 && ans[collideId] != -1 && ans[collideId] < float64(cars[collideId][0]-cars[r][0])/float64(cars[r][1]-cars[collideId][1]) {
            collideId = rightGreater[collideId]
        }
        if collideId != -1 {
            ans[r] = float64(cars[collideId][0]-cars[r][0]) / float64(cars[r][1]-cars[collideId][1])
        }
    }
    return ans
}
