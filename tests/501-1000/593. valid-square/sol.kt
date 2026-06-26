class Solution {
    fun validSquare(p1: IntArray, p2: IntArray, p3: IntArray, p4: IntArray): Boolean {
        fun getDistSq(pt1: IntArray, pt2: IntArray): Int {
            return (pt1[0] - pt2[0]) * (pt1[0] - pt2[0]) + 
                   (pt1[1] - pt2[1]) * (pt1[1] - pt2[1])
        }
        
        val points = listOf(p1, p2, p3, p4)
        val distances = mutableSetOf<Int>()
        
        for (i in 0 until 4) {
            for (j in i + 1 until 4) {
                distances.add(getDistSq(points[i], points[j]))
            }
        }
        
        return distances.size == 2 && 0 !in distances
    }
}
