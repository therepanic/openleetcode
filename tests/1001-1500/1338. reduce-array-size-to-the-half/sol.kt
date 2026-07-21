class Solution {
    fun minSetSize(arr: IntArray): Int {
        val freq = mutableMapOf<Int, Int>()
        for (num in arr) {
            freq[num] = freq.getOrDefault(num, 0) + 1
        }
        
        val counts = freq.values.sortedDescending()
        
        var sumRemoved = 0
        var minSetSize = 0
        for (count in counts) {
            sumRemoved += count
            minSetSize++
            if (sumRemoved >= arr.size / 2) {
                return minSetSize
            }
        }
        return minSetSize
    }
}
