class Solution(nums: IntArray) {
    private val map = mutableMapOf<Int, MutableList<Int>>()

    init {
        for ((i, v) in nums.withIndex()) {
            map.getOrPut(v) { mutableListOf() }.add(i)
        }
    }

    fun pick(target: Int): Int {
        val indices = map[target]!!
        return indices.random()
    }
}
