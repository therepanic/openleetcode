class Solution {
    fun maxArea(h: Int, w: Int, horizontalCuts: IntArray, verticalCuts: IntArray): Int {
        val MOD = 1_000_000_007
        
        horizontalCuts.sort()
        verticalCuts.sort()
        
        var maxH = maxOf(horizontalCuts[0].toLong(), (h - horizontalCuts.last()).toLong())
        for (i in 1 until horizontalCuts.size) {
            maxH = maxOf(maxH, (horizontalCuts[i] - horizontalCuts[i - 1]).toLong())
        }
        
        var maxV = maxOf(verticalCuts[0].toLong(), (w - verticalCuts.last()).toLong())
        for (i in 1 until verticalCuts.size) {
            maxV = maxOf(maxV, (verticalCuts[i] - verticalCuts[i - 1]).toLong())
        }
        
        return ((maxH * maxV) % MOD).toInt()
    }
}
