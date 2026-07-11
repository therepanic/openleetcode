class Solution {
    fun hasGroupsSizeX(deck: IntArray): Boolean {
        val counts = mutableMapOf<Int, Int>()
        for (card in deck) {
            counts[card] = counts.getOrDefault(card, 0) + 1
        }
        
        fun gcd(a: Int, b: Int): Int {
            var x = a
            var y = b
            while (y > 0) {
                val temp = y
                y = x % y
                x = temp
            }
            return x
        }
        
        val frequencies = counts.values.toList()
        var currentGcd = frequencies[0]
        
        for (count in frequencies.drop(1)) {
            currentGcd = gcd(currentGcd, count)
            if (currentGcd == 1) {
                return false
            }
        }
        
        return currentGcd >= 2
    }
}
