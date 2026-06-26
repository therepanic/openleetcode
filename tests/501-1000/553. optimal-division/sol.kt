class Solution {
    fun optimalDivision(nums: IntArray): String {
        val result = StringBuilder()
        result.append(nums[0])
        
        if (nums.size == 1) {
            return result.toString()
        }
        
        if (nums.size == 2) {
            return result.append('/').append(nums[1]).toString()
        }
        
        result.append("/(").append(nums[1])
        for (i in 2 until nums.size) {
            result.append('/').append(nums[i])
        }
        
        return result.append(')').toString()
    }
}
