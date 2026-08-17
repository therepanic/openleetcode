class Solution {
    fun getMinDistance(nums: IntArray, target: Int, start: Int): Int {
        if (nums[start] == target) {
            return 0
        }
        
        val n = nums.size
        var d = 1
        
        while (true) {
            if (start - d >= 0 && nums[start - d] == target) {
                return d
            }
            
            if (start + d < n && nums[start + d] == target) {
                return d
            }
            
            d++
        }
    }
}
