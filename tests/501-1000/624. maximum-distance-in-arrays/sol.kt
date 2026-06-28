class Solution {
    fun maxDistance(arrays: List<List<Int>>): Int {
        var smallest = arrays[0][0]
        var largest = arrays[0][arrays[0].size - 1]
        var ans = 0
        for (i in 1 until arrays.size) {
            val curMin = arrays[i][0]
            val curMax = arrays[i][arrays[i].size - 1]
            ans = maxOf(ans, maxOf(largest - curMin, curMax - smallest))
            smallest = minOf(curMin, smallest)
            largest = maxOf(curMax, largest)
        }
        return ans
    }
}
