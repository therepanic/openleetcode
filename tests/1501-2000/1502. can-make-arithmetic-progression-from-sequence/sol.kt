class Solution {
    fun canMakeArithmeticProgression(arr: IntArray): Boolean {
        arr.sort()
        val diff = arr[1] - arr[0]
        for (i in 0 until arr.size - 1) {
            if (arr[i+1] - arr[i] != diff) {
                return false
            }
        }
        return true
    }
}
