class Solution {
    fun rectangleArea(rectangles: Array<IntArray>): Int {
        val MOD = 1000000007
        val OPEN = 0
        val CLOSE = 1
        
        val events = mutableListOf<Triple<Int, Int, Pair<Int, Int>>>()
        for (r in rectangles) {
            val (x1, y1, x2, y2) = r
            events.add(Triple(y1, OPEN, Pair(x1, x2)))
            events.add(Triple(y2, CLOSE, Pair(x1, x2)))
        }
        events.sortBy { it.first }
        
        var res = 0L
        var curY = events[0].first
        val active = mutableListOf<Pair<Int, Int>>()
        
        for ((y, typ, pair) in events) {
            val (x1, x2) = pair
            
            var q = 0L
            var cur = -1
            active.sortBy { it.first }
            for ((ax1, ax2) in active) {
                q += maxOf(0, ax2 - maxOf(cur, ax1))
                cur = maxOf(cur, ax2)
            }
            
            res = (res + q * (y - curY)) % MOD
            curY = y
            
            if (typ == OPEN) {
                active.add(Pair(x1, x2))
            } else {
                active.remove(Pair(x1, x2))
            }
        }
        
        return res.toInt()
    }
}
