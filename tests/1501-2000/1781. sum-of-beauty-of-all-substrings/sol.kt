class Solution {
    fun beautySum(s: String): Int {
        val n = s.length
        var sumOfBeauty = 0
        for (i in 0 until n) {
            val freq = IntArray(26)
            for (j in i until n) {
                freq[s[j] - 'a']++
                var maxi = Int.MIN_VALUE
                var mini = Int.MAX_VALUE
                for (diff in freq) {
                    if (diff > 0) {
                        maxi = maxOf(maxi, diff)
                        mini = minOf(mini, diff)
                    }
                }
                sumOfBeauty += (maxi - mini)
            }
        }
        return sumOfBeauty
    }
}
