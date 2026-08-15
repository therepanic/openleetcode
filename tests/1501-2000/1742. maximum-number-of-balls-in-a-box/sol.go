func countBalls(lowLimit int, highLimit int) int {
    boxCount := make(map[int]int)
    maxBalls := 0
    for num := lowLimit; num <= highLimit; num++ {
        box := 0
        temp := num
        for temp > 0 {
            box += temp % 10
            temp /= 10
        }
        boxCount[box]++
        if boxCount[box] > maxBalls {
            maxBalls = boxCount[box]
        }
    }
    return maxBalls
}
