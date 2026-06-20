class Solution {
    fun thirdMax(nums: IntArray): Int {
        var first: Int? = null
        var second: Int? = null
        var third: Int? = null
        for (num in nums) {
            if (num == first || num == second || num == third) {
                continue
            }
            if (first == null || num > first) {
                third = second
                second = first
                first = num
            } else if (second == null || num > second) {
                third = second
                second = num
            } else if (third == null || num > third) {
                third = num
            }
        }
        return third ?: first!!
    }
}
