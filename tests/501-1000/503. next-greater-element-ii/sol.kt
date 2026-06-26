class Solution {
    fun nextGreaterElements(nums: IntArray): IntArray {
        val n = nums.size
        val res = IntArray(n)
        for (i in 0 until n) {
            res[i] = -1
            for (j in i + 1 until n) {
                if (nums[j] > nums[i]) {
                    res[i] = nums[j]
                    break
                }
            }
            if (res[i] == -1) {
                for (j in 0 until i) {
                    if (nums[j] > nums[i]) {
                        res[i] = nums[j]
                        break
                    }
                }
            }
        }
        return res
    }
}
