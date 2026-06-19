class Solution {
    fun poorPigs(buckets: Int, minutesToDie: Int, minutesToTest: Int): Int {
        val base = minutesToTest / minutesToDie + 1
        var ans = 0
        var n = 1
        while (n < buckets) {
            n *= base
            ans++
        }
        return ans
    }
}
