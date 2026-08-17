class Solution {
    fun countQuadruplets(nums: IntArray): Int {
        var res = 0
        val n = nums.size
        for (w in 0 until n) {
            for (x in w + 1 until n) {
                for (y in x + 1 until n) {
                    for (z in y + 1 until n) {
                        if (nums[w] + nums[x] + nums[y] == nums[z]) res++
                    }
                }
            }
        }
        return res
    }
}
