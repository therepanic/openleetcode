class Solution {
    fun containsNearbyDuplicate(nums: IntArray, k: Int): Boolean {
        val windowSet = HashSet<Int>()
        
        for (i in nums.indices) {
            if (i > k) {
                windowSet.remove(nums[i - k - 1])
            }
            
            if (windowSet.contains(nums[i])) {
                return true
            }
            
            windowSet.add(nums[i])
        }
        
        return false
    }
}
