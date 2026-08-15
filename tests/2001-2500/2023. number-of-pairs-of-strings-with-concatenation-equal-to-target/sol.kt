class Solution {
    fun numOfPairs(nums: Array<String>, target: String): Int {
        val freq = nums.groupingBy { it }.eachCount()

        var totalCnt = 0

        for (num in nums) {
            if (target.startsWith(num)) {
                val remain = target.substring(num.length)

                if (remain == num) {
                    totalCnt += (freq[remain] ?: 0) - 1
                } else {
                    totalCnt += freq[remain] ?: 0
                }
            }
        }

        return totalCnt
    }
}
