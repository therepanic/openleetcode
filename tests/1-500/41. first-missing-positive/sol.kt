class Solution {
    fun firstMissingPositive(nums: IntArray): Int {
        val seen = HashSet<Int>()
        for (num in nums) {
            seen.add(num)
        }
        var i = 1
        while (seen.contains(i)) {
            i++
        }
        return i
    }
}
