class Solution {
    fun rob(nums: IntArray): Int {
        var include = 0
        var exclude = 0
        for (value in nums) {
            val nextInclude = exclude + value
            exclude = if (include > exclude) include else exclude
            include = nextInclude
        }
        return if (include > exclude) include else exclude
    }
}
