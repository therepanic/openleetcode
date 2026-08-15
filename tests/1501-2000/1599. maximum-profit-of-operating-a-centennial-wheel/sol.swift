class Solution {
    func minOperationsMaxProfit(_ customers: [Int], _ boardingCost: Int, _ runningCost: Int) -> Int {
        var wait = 0
        var profit = 0
        var maxProfit = 0
        var ans = -1
        var i = 0
        var rotation = 0

        while i < customers.count || wait > 0 {
            if i < customers.count {
                wait += customers[i]
            }
            let boarded = min(4, wait)
            wait -= boarded

            rotation += 1
            profit += boarded * boardingCost - runningCost

            if profit > maxProfit {
                maxProfit = profit
                ans = rotation
            }

            i += 1
        }

        return ans
    }
}
