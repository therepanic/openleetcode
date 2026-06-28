class Solution {
    fun isPossible(nums: IntArray): Boolean {
        val count = mutableMapOf<Int, Int>()
        for (num in nums) {
            count[num] = count.getOrDefault(num, 0) + 1
        }
        val subseq = mutableMapOf<Int, Int>()

        for (num in nums) {
            if (count[num] == 0) continue
            if (subseq.getOrDefault(num - 1, 0) > 0) {
                subseq[num - 1] = subseq[num - 1]!! - 1
                subseq[num] = subseq.getOrDefault(num, 0) + 1
            } else if (count.getOrDefault(num + 1, 0) > 0 && count.getOrDefault(num + 2, 0) > 0) {
                count[num + 1] = count[num + 1]!! - 1
                count[num + 2] = count[num + 2]!! - 1
                subseq[num + 2] = subseq.getOrDefault(num + 2, 0) + 1
            } else {
                return false
            }
            count[num] = count[num]!! - 1
        }

        return true
    }
}
