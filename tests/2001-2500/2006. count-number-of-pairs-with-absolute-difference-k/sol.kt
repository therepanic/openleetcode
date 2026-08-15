class Solution {
    fun countKDifference(nums: IntArray, k: Int): Int {
        val c = HashMap<Int, Int>()
        for (value in nums) c[value] = (c[value] ?: 0) + 1
        var result = 0
        for ((x, cnt) in c) result += cnt * (c[x + k] ?: 0)
        return result
    }
}
