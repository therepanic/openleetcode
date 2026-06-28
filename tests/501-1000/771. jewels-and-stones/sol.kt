class Solution {
    fun numJewelsInStones(jewels: String, stones: String): Int {
        var count = 0
        for (i in jewels) {
            if (i in stones) {
                count += stones.count { it == i }
            }
        }
        return count
    }
}
