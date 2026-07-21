class Solution {
    fun numberOfSubarrays(nums: IntArray, k: Int): Int {
        val count = mutableMapOf(0 to 1)
        var odd = 0
        var answer = 0
        for (value in nums) {
            odd += value % 2
            answer += count.getOrDefault(odd - k, 0)
            count[odd] = count.getOrDefault(odd, 0) + 1
        }
        return answer
    }
}
