class Solution {
    fun findDiagonalOrder(nums: Array<IntArray>): IntArray {
        return findDiagonalOrder(nums.map { it.toList() })
    }

    fun findDiagonalOrder(nums: List<List<Int>>): IntArray {
        val l = mutableListOf<Triple<Int, Int, Int>>()
        for (i in nums.indices) {
            for (j in nums[i].indices) {
                l.add(Triple(i + j, i, j))
            }
        }

        val h = mutableMapOf<Int, MutableList<Int>>()
        for ((sum, i, j) in l) {
            h.getOrPut(sum) { mutableListOf() }.add(nums[i][j])
        }

        val sortedKeys = h.keys.sorted()
        val result = mutableListOf<Int>()
        for (key in sortedKeys) {
            result.addAll(h[key]!!.reversed())
        }
        return result.toIntArray()
    }
}
