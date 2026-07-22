class Solution {
    fun checkStraightLine(coordinates: Array<IntArray>): Boolean {
        var x1 = coordinates[0][0]
        var y1 = coordinates[0][1]
        var x2 = coordinates[1][0]
        var y2 = coordinates[1][1]
        
        val slope: Double
        if (x2 == x1) {
            slope = Double.POSITIVE_INFINITY
        } else {
            slope = (y2 - y1).toDouble() / (x2 - x1)
        }
        
        val n = coordinates.size
        for (i in 1 until n - 1) {
            x1 = coordinates[i][0]
            y1 = coordinates[i][1]
            x2 = coordinates[i + 1][0]
            y2 = coordinates[i + 1][1]
            
            val currSlope: Double
            if (x2 == x1) {
                currSlope = Double.POSITIVE_INFINITY
            } else {
                currSlope = (y2 - y1).toDouble() / (x2 - x1)
            }
            
            if (currSlope != slope) {
                return false
            }
        }
        
        return true
    }
}
