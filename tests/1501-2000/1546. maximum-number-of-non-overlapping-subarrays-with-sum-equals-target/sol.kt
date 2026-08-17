class Solution {
    fun maxNonOverlapping(nums: IntArray, target: Int): Int {
        var numOfSubarrays = 0
        var temp = 0
        var visited = mutableSetOf(0)
        for (num in nums) {
            temp += num
            val prev = temp - target
            if (prev in visited) {
                visited = mutableSetOf()
                numOfSubarrays++
            }
            visited.add(temp)
        }
        return numOfSubarrays
    }
}
