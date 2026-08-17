func minOperationsMaxProfit(customers []int, boardingCost int, runningCost int) int {
    wait := 0
    profit := 0
    maxProfit := 0
    ans := -1
    i := 0
    rotation := 0

    for i < len(customers) || wait > 0 {
        if i < len(customers) {
            wait += customers[i]
        }
        boarded := wait
        if boarded > 4 {
            boarded = 4
        }
        wait -= boarded

        rotation++
        profit += boarded*boardingCost - runningCost

        if profit > maxProfit {
            maxProfit = profit
            ans = rotation
        }

        i++
    }

    return ans
}
