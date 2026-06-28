class Solution {
    fun maxChunksToSorted(arr: IntArray): Int {
        var ans = 0
        var prevMax = 0
        for (idx in arr.indices) {
            prevMax = maxOf(prevMax, arr[idx])
            if (prevMax == idx) {
                ans++
            }
        }
        return ans
    }
}
