class Solution {
    fun maxCoins(piles: IntArray): Int {
        piles.sort()
        var l = 0
        var r = piles.size
        var count = 0
        for (i in 0 until piles.size / 3) {
            count += piles[r-2]
            l += 1
            r -= 2
        }
        return count
    }
}
