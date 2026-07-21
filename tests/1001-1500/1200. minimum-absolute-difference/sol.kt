class Solution {
    fun minimumAbsDifference(arr: IntArray): List<List<Int>> {
        arr.sort()
        var minDiff = Int.MAX_VALUE
        for (i in 1 until arr.size) {
            minDiff = minOf(minDiff, arr[i] - arr[i - 1])
        }
        val result = mutableListOf<List<Int>>()
        for (i in 1 until arr.size) {
            if (arr[i] - arr[i - 1] == minDiff) {
                result.add(listOf(arr[i - 1], arr[i]))
            }
        }
        return result
    }
}
