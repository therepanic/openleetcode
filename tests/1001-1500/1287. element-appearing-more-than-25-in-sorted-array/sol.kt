class Solution {
    fun findSpecialInteger(arr: IntArray): Int {
        val n = arr.size
        val q = n / 4
        val m = mutableMapOf<Int, Int>()
        for (num in arr) {
            m[num] = m.getOrDefault(num, 0) + 1
            if (m[num]!! > q) {
                return num
            }
        }
        return -1
    }
}
