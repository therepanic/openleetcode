class Solution {
    fun interchangeableRectangles(rectangles: Array<IntArray>): Long {
        fun gcd(a: Int, b: Int): Int {
            var x = a
            var y = b
            while (y != 0) {
                val temp = x % y
                x = y
                y = temp
            }
            return x
        }
        
        val ratioCount = mutableMapOf<Pair<Int, Int>, Int>()
        var result = 0L
        
        for (rect in rectangles) {
            val width = rect[0]
            val height = rect[1]
            val g = gcd(width, height)
            val reduced = Pair(width / g, height / g)
            result += ratioCount[reduced] ?: 0
            ratioCount[reduced] = (ratioCount[reduced] ?: 0) + 1
        }
        
        return result
    }
}
