func maximumWealth(accounts [][]int) int {
    rich := 0
    for _, i := range accounts {
        sum := 0
        for _, j := range i {
            sum += j
        }
        if sum > rich {
            rich = sum
        }
    }
    return rich
}
