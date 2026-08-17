class Solution {
    fun maxFrequency(nums: IntArray, k: Int): Int {
        nums.sort()
        var left = 0
        var right = 0
        var res = 0
        var total = 0L

        while (right < nums.size) {
            total += nums[right]

            while (nums[right].toLong() * (right - left + 1) > total + k) {
                total -= nums[left]
                left++
            }
            
            res = maxOf(res, right - left + 1)
            right++
        }
        
        return res
    }
}
