class Solution {
    fun isRectangleCover(rectangles: Array<IntArray>): Boolean {
        var area = 0L
        val corners = mutableSetOf<String>()
        
        for (rect in rectangles) {
            val (x, y, X, Y) = rect
            area += (X - x).toLong() * (Y - y).toLong()
            
            val p1 = "$x,$y"
            val p2 = "$x,$Y"
            val p3 = "$X,$y"
            val p4 = "$X,$Y"
            
            if (!corners.add(p1)) corners.remove(p1)
            if (!corners.add(p2)) corners.remove(p2)
            if (!corners.add(p3)) corners.remove(p3)
            if (!corners.add(p4)) corners.remove(p4)
        }
        
        if (corners.size != 4) return false
        
        var minX = Int.MAX_VALUE
        var minY = Int.MAX_VALUE
        var maxX = Int.MIN_VALUE
        var maxY = Int.MIN_VALUE
        
        for (point in corners) {
            val (xStr, yStr) = point.split(",")
            val x = xStr.toInt()
            val y = yStr.toInt()
            minX = minOf(minX, x)
            minY = minOf(minY, y)
            maxX = maxOf(maxX, x)
            maxY = maxOf(maxY, y)
        }
        
        return (maxX - minX).toLong() * (maxY - minY).toLong() == area
    }
}
