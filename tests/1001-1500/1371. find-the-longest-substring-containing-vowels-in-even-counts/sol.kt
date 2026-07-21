class Solution {
    fun findTheLongestSubstring(s: String): Int {
        val mapy = IntArray(32) { -2 }
        mapy[0] = -1

        var res = 0
        var mask = 0

        for (i in s.indices) {
            val c = s[i]
            when (c) {
                'a' -> mask = mask xor 1
                'e' -> mask = mask xor 2
                'i' -> mask = mask xor 4
                'o' -> mask = mask xor 8
                'u' -> mask = mask xor 16
            }

            val prev = mapy[mask]
            if (prev == -2) mapy[mask] = i
            else res = maxOf(res, i - prev)
        }

        return res
    }
}
