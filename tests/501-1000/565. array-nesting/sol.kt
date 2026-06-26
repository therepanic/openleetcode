class Solution {
    fun arrayNesting(nums: IntArray): Int {
        var maxCount = 0
        
        for (i in nums.indices) {
            if (nums[i] == -1) {
                continue
            }
            
            var currentCount = 0
            var start = i
            
            while (nums[start] != -1) {
                val nextNode = nums[start]
                nums[start] = -1
                start = nextNode
                currentCount++
            }
            
            if (currentCount > maxCount) {
                maxCount = currentCount
            }
        }
        
        return maxCount
    }
}
