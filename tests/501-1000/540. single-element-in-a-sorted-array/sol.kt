class Solution {
    fun singleNonDuplicate(nums: IntArray): Int {
        var left = 0
        var right = nums.size - 1
        
        while (left < right) {
            var mid = left + (right - left) / 2
            
            if (mid % 2 == 1) {
                mid--
            }
            
            if (nums[mid] == nums[mid + 1]) {
                left = mid + 2
            } else {
                right = mid
            }
        }
        
        return nums[left]
    }
}
