class Solution {
    fun canPlaceFlowers(flowerbed: IntArray, n: Int): Boolean {
        if (n == 0) return true
        var remaining = n
        val length = flowerbed.size
        for (i in 0 until length) {
            if (flowerbed[i] == 0) {
                val left = (i == 0) || (flowerbed[i-1] == 0)
                val right = (i == length-1) || (flowerbed[i+1] == 0)
                if (left && right) {
                    flowerbed[i] = 1
                    remaining--
                    if (remaining == 0) return true
                }
            }
        }
        return false
    }
}
