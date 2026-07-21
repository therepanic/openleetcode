class Solution {
    fun getLastMoment(n: Int, left: IntArray, right: IntArray): Int {
        var maxVal = 0
        for (value in left) {
            maxVal = maxOf(value, maxVal)
        }
        for (value in right) {
            maxVal = maxOf(n - value, maxVal)
        }
        return maxVal
    }
}
