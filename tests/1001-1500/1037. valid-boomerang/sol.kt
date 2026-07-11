class Solution {
    fun isBoomerang(points: Array<IntArray>): Boolean {
        val x1=points[0][0]
        val y1=points[0][1]
        val x2=points[1][0]
        val y2=points[1][1]
        val x3=points[2][0]
        val y3=points[2][1]
        if ((y2-y1)*(x3-x2)==(y3-y2)*(x2-x1))
            return false
        return true
    }
}
