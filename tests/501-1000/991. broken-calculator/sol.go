func brokenCalc(startValue int, target int) int {
    ans := 0
    for target > startValue {
        ans++
        if target%2 == 1 {
            target += 1
        } else {
            target /= 2
        }
    }
    return ans + startValue - target
}
