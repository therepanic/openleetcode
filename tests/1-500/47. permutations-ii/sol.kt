class Solution {
    fun permuteUnique(nums: IntArray): List<List<Int>> {
        nums.sort()
        val res = mutableListOf<List<Int>>()
        val used = BooleanArray(nums.size)
        dfs(nums, used, mutableListOf(), res)
        return res
    }

    private fun dfs(
        nums: IntArray,
        used: BooleanArray,
        cur: MutableList<Int>,
        res: MutableList<List<Int>>
    ) {
        if (cur.size == nums.size) {
            res.add(cur.toList())
            return
        }

        for (i in nums.indices) {
            if (used[i]) continue
            if (i > 0 && nums[i] == nums[i - 1] && !used[i - 1]) continue
            used[i] = true
            cur.add(nums[i])
            dfs(nums, used, cur, res)
            cur.removeAt(cur.size - 1)
            used[i] = false
        }
    }
}
