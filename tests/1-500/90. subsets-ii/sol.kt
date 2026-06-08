class Solution {
    fun subsetsWithDup(nums: IntArray): List<List<Int>> {
        nums.sort()
        val result = mutableListOf<List<Int>>()
        dfs(0, nums, mutableListOf(), result)
        return result
    }

    private fun dfs(start: Int, nums: IntArray, current: MutableList<Int>, result: MutableList<List<Int>>) {
        result.add(current.toList())
        for (i in start until nums.size) {
            if (i > start && nums[i] == nums[i - 1]) continue
            current.add(nums[i])
            dfs(i + 1, nums, current, result)
            current.removeAt(current.lastIndex)
        }
    }
}
