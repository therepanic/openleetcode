class Solution {
    func brokenCalc(_ startValue: Int, _ target: Int) -> Int {
        var ans = 0
        var t = target
        while t > startValue {
            ans += 1
            if t % 2 == 1 {
                t += 1
            } else {
                t /= 2
            }
        }
        return ans + startValue - t
    }
}
