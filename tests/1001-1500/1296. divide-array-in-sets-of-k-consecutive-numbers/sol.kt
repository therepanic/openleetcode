class Solution {
    fun isPossibleDivide(nums: IntArray, k: Int): Boolean {
        if (nums.size % k != 0) return false
        val count = mutableMapOf<Int, Int>()
        for (num in nums) {
            count[num] = count.getOrDefault(num, 0) + 1
        }
        nums.sort()
        for (num in nums) {
            if (count[num] == 0) continue
            for (i in 0 until k) {
                val cur = num + i
                if (count.getOrDefault(cur, 0) == 0) return false
                count[cur] = count[cur]!! - 1
            }
        }
        return true
    }
}
