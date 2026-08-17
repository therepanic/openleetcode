class Solution {
    fun getWinner(arr: IntArray, k: Int): Int {
        var candidate = arr[0]
        var streak = 0
        for (i in 1 until arr.size) {
            if (candidate > arr[i]) {
                streak++
            } else {
                candidate = arr[i]
                streak = 1
            }
            if (streak == k) return candidate
        }
        return candidate
    }
}
