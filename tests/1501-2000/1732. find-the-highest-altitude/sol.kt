class Solution {
    fun largestAltitude(gain: IntArray): Int {
        var ans = 0
        var acc = 0
        for (it in gain) {
            acc += it
            ans = maxOf(ans, acc)
        }
        return ans
    }
}
