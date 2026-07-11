class Solution {
    fun peakIndexInMountainArray(arr: IntArray): Int {
        var l = 0
        var r = arr.size - 1
        while (l < r) {
            val mid = (l + r) / 2
            if (arr[mid] < arr[mid + 1]) {
                l = mid + 1
            } else {
                r = mid
            }
        }
        return l
    }
}
