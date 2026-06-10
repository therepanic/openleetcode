class Solution {
    fun twoSum(numbers: IntArray, target: Int): IntArray {
        var left = 0
        var right = numbers.size - 1
        while (left < right) {
            val total = numbers[left] + numbers[right]
            if (total == target) return intArrayOf(left + 1, right + 1)
            if (total < target) {
                left += 1
            } else {
                right -= 1
            }
        }
        return intArrayOf()
    }
}
