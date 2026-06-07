class Solution {
    fun permute(nums: IntArray): List<List<Int>> {
        val res = mutableListOf<List<Int>>()
        dfs(0, nums, res)
        return res
    }

    private fun dfs(i: Int, nums: IntArray, res: MutableList<List<Int>>) {
        if (i == nums.size) {
            val cur = mutableListOf<Int>()
            for (num in nums) {
                cur.add(num)
            }
            res.add(cur)
            return
        }

        for (j in i until nums.size) {
            val tmp = nums[i]
            nums[i] = nums[j]
            nums[j] = tmp
            dfs(i + 1, nums, res)
            val restore = nums[i]
            nums[i] = nums[j]
            nums[j] = restore
        }
    }
}
