class Solution {
    fun sortedSquares(nums: IntArray): IntArray {
        val newarr = mutableListOf<Int>()
        for (i in nums) {
            newarr.add(i * i)
        }
        newarr.sort()
        return newarr.toIntArray()
    }
}
