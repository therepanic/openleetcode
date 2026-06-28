func numRabbits(answers []int) int {
    mpp := make(map[int]int)
    for _, a := range answers {
        mpp[a]++
    }
    total := 0
    for x, count := range mpp {
        total += (count + x) / (x + 1) * (x + 1)
    }
    return total
}
