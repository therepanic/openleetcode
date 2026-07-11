class Solution {
    fun sortArrayByParityII(nums: IntArray): IntArray {
        var i = 0
        var j = 1
        val n = nums.size
        
        while (i < n && j < n) {
            if (nums[i] % 2 == 0) {
                i += 2
            } else if (nums[j] % 2 == 1) {
                j += 2
            } else {
                val temp = nums[i]
                nums[i] = nums[j]
                nums[j] = temp
                i += 2
                j += 2
            }
        }
        return nums
    }
}
