class Solution {
    fun findKthPositive(arr: IntArray, k: Int): Int {
        var low = 0
        var high = arr.size - 1
        while (low <= high) {
            val mid = (low + high) / 2
            val missing = arr[mid] - (mid + 1)
            if (missing < k) {
                low = mid + 1
            } else {
                high = mid - 1
            }
        }
        return high + 1 + k
    }
}
