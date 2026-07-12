class Solution {
    fun relativeSortArray(arr1: IntArray, arr2: IntArray): IntArray {
        val freq = IntArray(1001)
        for (num in arr1) {
            freq[num]++
        }
        var idx = 0
        for (num in arr2) {
            while (freq[num] > 0) {
                arr1[idx++] = num
                freq[num]--
            }
        }
        for (num in 0..1000) {
            while (freq[num] > 0) {
                arr1[idx++] = num
                freq[num]--
            }
        }
        return arr1
    }
}
