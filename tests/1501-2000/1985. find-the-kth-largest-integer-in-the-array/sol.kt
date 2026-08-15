class Solution {
    fun kthLargestNumber(nums: Array<String>, k: Int): String {
        nums.sortWith(compareByDescending<String> { it.length }.thenByDescending { it })
        return nums[k - 1]
    }
}
