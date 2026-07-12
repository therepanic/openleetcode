class Solution {
    fun beautifulArray(n: Int): IntArray {
        if (n == 1) {
            return intArrayOf(1)
        }
        
        val left = beautifulArray((n + 1) / 2)
        val right = beautifulArray(n / 2)
        
        val result = IntArray(n)
        var idx = 0
        
        for (x in left) {
            result[idx++] = 2 * x - 1
        }
        for (x in right) {
            result[idx++] = 2 * x
        }
        
        return result
    }
}
