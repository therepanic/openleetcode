class Solution {
    fun brokenCalc(startValue: Int, target: Int): Int {
        var ans = 0
        var t = target
        while (t > startValue) {
            ans++
            if (t % 2 == 1) {
                t += 1
            } else {
                t /= 2
            }
        }
        return ans + startValue - t
    }
}
