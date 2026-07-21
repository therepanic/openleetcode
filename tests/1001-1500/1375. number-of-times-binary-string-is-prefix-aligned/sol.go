func numTimesAllBlue(flips []int) int {
    res := 0
    maxFlips := 0
    
    for i, flip := range flips {
        if flip > maxFlips {
            maxFlips = flip
        }
        if maxFlips == i+1 {
            res++
        }
    }
    
    return res
}
