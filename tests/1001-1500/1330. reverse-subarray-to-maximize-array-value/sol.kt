class Solution {
    fun maxValueAfterReverse(nums: IntArray): Int {
        if (nums.size < 2) return 0
        
        var maxMin = Int.MIN_VALUE
        var minMin = Int.MAX_VALUE
        var S = 0
        var boundary = Int.MIN_VALUE
        
        for (i in 0 until nums.size - 1) {
            val a = nums[i]
            val b = nums[i + 1]
            val distance = Math.abs(a - b)
            boundary = maxOf(boundary, maxOf(Math.abs(nums.last() - a), Math.abs(nums[0] - b)) - distance)
            S += distance
            minMin = minOf(maxOf(a, b), minMin)
            maxMin = maxOf(minOf(a, b), maxMin)
        }
        
        return S + maxOf(2 * (maxMin - minMin), boundary)
    }
}
