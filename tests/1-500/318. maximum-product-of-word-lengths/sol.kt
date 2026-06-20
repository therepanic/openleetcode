class Solution {
    fun maxProduct(words: Array<String>): Int {
        val n = words.size
        val bitmasks = IntArray(n)
        for (i in words.indices) {
            var mask = 0
            for (c in words[i].toCharArray()) {
                mask = mask or (1 shl (c - 'a'))
            }
            bitmasks[i] = mask
        }
        var maxProd = 0
        for (i in 0 until n) {
            for (j in i + 1 until n) {
                if ((bitmasks[i] and bitmasks[j]) == 0) {
                    maxProd = maxOf(maxProd, words[i].length * words[j].length)
                }
            }
        }
        return maxProd
    }
}
