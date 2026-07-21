class Solution {
    fun numOfSubarrays(arr: IntArray, k: Int, threshold: Int): Int {
        var res = 0
        var left = 0
        var total = 0
        for (right in arr.indices) {
            total += arr[right]
            if (right - left + 1 == k) {
                if (total / k >= threshold) {
                    res++
                }
                total -= arr[left]
                left++
            }
        }
        return res
    }
}
