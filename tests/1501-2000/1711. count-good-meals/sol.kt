class Solution {
    fun countPairs(deliciousness: IntArray): Int {
        val MOD = 1_000_000_007
        val maxVal = deliciousness.maxOrNull() ?: 0
        val powers = IntArray(22) { 1 shl it }
        val count = mutableMapOf<Int, Int>()
        var res = 0L

        for (value in deliciousness) {
            for (target in powers) {
                val complement = target - value
                if (count.containsKey(complement)) {
                    res += count[complement]!!
                    res %= MOD
                }
            }
            count[value] = (count[value] ?: 0) + 1
        }
        return res.toInt()
    }
}
