class Solution {
    fun summaryRanges(nums: IntArray): List<String> {
        val result = mutableListOf<String>()
        var i = 0
        
        while (i < nums.size) {
            val start = nums[i]
            var j = i
            while (j + 1 < nums.size && nums[j + 1] == nums[j] + 1) {
                j++
            }
            
            if (nums[j] == start) {
                result.add(start.toString())
            } else {
                result.add("$start->${nums[j]}")
            }
            
            i = j + 1
        }
        
        return result
    }
}
