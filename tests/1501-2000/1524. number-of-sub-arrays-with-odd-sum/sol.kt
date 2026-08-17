class Solution {
    fun numOfSubarrays(arr: IntArray): Int {
        var oddCount = 0L
        var prefixSum = 0L
        val mod = 1_000_000_007
        for (a in arr) {
            prefixSum += a
            oddCount += prefixSum % 2
        }
        oddCount += (arr.size - oddCount) * oddCount
        return (oddCount % mod).toInt()
    }
}
