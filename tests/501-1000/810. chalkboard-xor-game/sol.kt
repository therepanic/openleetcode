class Solution {
    fun xorGame(nums: IntArray): Boolean {
        var totalXor = 0
        for (value in nums) {
            totalXor = totalXor xor value
        }
        
        val isXorZero = (totalXor == 0)
        val hasEvenLength = (nums.size % 2 == 0)
        
        return isXorZero || hasEvenLength
    }
}
