class Solution {
    fun subarraySum(nums: IntArray, k: Int): Int {
        val subNum = mutableMapOf(0 to 1)
        var total = 0
        var count = 0
        
        for (n in nums) {
            total += n
            
            if (subNum.containsKey(total - k)) {
                count += subNum[total - k]!!
            }
            
            subNum[total] = subNum.getOrDefault(total, 0) + 1
        }
        
        return count
    }
}
