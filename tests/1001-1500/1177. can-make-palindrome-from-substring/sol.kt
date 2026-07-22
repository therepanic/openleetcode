class Solution {
    fun canMakePaliQueries(s: String, queries: Array<IntArray>): List<Boolean> {
        val n = s.length
        val prefix = IntArray(n + 1)
        
        for (i in 0 until n) {
            val bit = 1 shl (s[i] - 'a')
            prefix[i + 1] = prefix[i] xor bit
        }
        
        val res = mutableListOf<Boolean>()
        
        for ((left, right, ki) in queries) {
            val mask = prefix[right + 1] xor prefix[left]
            val oddCount = Integer.bitCount(mask)
            
            if (oddCount <= 1 || ki >= oddCount / 2) {
                res.add(true)
            } else {
                res.add(false)
            }
        }
        
        return res
    }
}
