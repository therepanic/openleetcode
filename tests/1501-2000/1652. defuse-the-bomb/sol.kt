class Solution {
    fun decrypt(code: IntArray, k: Int): IntArray {
        val n = code.size
        val result = IntArray(n)
        
        if (k == 0) return result

        val window = Math.abs(k)
        var total = 0

        var start = if (k > 0) 1 else n - window
        var end = if (k > 0) window else n - 1

        for (i in start..end) {
            total += code[i % n]
        }
        for (i in 0 until n) {
            result[i] = total

            total -= code[start % n]
            start++

            end++
            total += code[end % n]
        }
        return result
    }
}
