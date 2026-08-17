class Solution {
    fun longestAwesome(s: String): Int {
        val n = s.length
        val mask = HashMap<Int, Int>()
        var curMask = 0
        mask[curMask] = -1
        var ans = 1
        for (i in 0 until n) {
            val num = s[i] - '0'
            curMask = curMask xor (1 shl num)
            val needMask = curMask
            mask[needMask]?.let { ans = maxOf(ans, i - it) }
            for (bit in 0..9) {
                val nNeedMax = needMask xor (1 shl bit)
                mask[nNeedMax]?.let { ans = maxOf(ans, i - it) }
            }
            mask.putIfAbsent(curMask, i)
        }
        return ans
    }
}
