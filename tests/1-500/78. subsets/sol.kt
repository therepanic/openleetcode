class Solution {
    fun subsets(nums: IntArray): List<List<Int>> {
        val result = mutableListOf<List<Int>>()
        result.add(emptyList())
        for (num in nums) {
            val size = result.size
            for (i in 0 until size) {
                val current = result[i].toMutableList()
                current.add(num)
                result.add(current)
            }
        }
        return result
    }
}
