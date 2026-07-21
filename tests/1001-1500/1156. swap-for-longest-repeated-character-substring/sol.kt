class Solution {
    fun maxRepOpt1(text: String): Int {
        val total = IntArray(26)
        for (c in text) {
            total[c - 'a']++
        }
        val n = text.length
        var ans = 0
        
        for (i in 0 until 26) {
            if (total[i] == 0) continue
            val ch = 'a' + i
            var left = 0
            var count = 0
            
            for (right in 0 until n) {
                if (text[right] == ch) {
                    count++
                }
                
                while ((right - left + 1) - count > 1) {
                    if (text[left] == ch) {
                        count--
                    }
                    left++
                }
                
                ans = maxOf(ans, minOf(right - left + 1, total[i]))
            }
        }
        
        return ans
    }
}
