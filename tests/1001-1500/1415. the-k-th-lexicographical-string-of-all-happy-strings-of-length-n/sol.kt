class Solution {
    fun getHappyString(n: Int, k: Int): String {
        val total = 3 * (1 shl (n - 1))
        if (k > total) {
            return ""
        }
        
        var kVar = k - 1
        val result = StringBuilder()
        var last = '\u0000'
        
        for (pos in 0 until n) {
            val branch = 1 shl (n - pos - 1)
            val choices = mutableListOf<Char>()
            for (c in "abc") {
                if (c != last) {
                    choices.add(c)
                }
            }
            
            val idx = kVar / branch
            result.append(choices[idx])
            
            last = choices[idx]
            kVar %= branch
        }
        
        return result.toString()
    }
}
