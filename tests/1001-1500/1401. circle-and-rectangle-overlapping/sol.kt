class Solution {
    fun checkOverlap(radius: Int, xCenter: Int, yCenter: Int, x1: Int, y1: Int, x2: Int, y2: Int): Boolean {
        val nearestX = maxOf(x1, minOf(x2, xCenter))
        val nearestY = maxOf(y1, minOf(y2, yCenter))
        val dist = (nearestX - xCenter) * (nearestX - xCenter) + (nearestY - yCenter) * (nearestY - yCenter)
        return dist <= radius * radius
    }
}
