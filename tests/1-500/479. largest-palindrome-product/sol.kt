class Solution {
    fun largestPalindrome(n: Int): Int {
        if (n == 1) {
            return 9
        }
        
        val minNum = Math.pow(10.0, (n - 1).toDouble()).toLong()
        val maxNum = Math.pow(10.0, n.toDouble()).toLong() - 1
        var maxPal = 0L
        
        var i = maxNum
        while (i >= minNum) {
            if (i * i < maxPal) {
                break
            }
            
            var j = maxNum
            while (j >= i) {
                val product = i * j
                
                if (product % 11 != 0L && product >= maxPal) {
                    j -= 2
                    continue
                }
                
                val str = product.toString()
                if (str == str.reversed()) {
                    maxPal = product
                }
                
                j -= 2
            }
            
            i -= 2
        }
        
        return (maxPal % 1337).toInt()
    }
}
