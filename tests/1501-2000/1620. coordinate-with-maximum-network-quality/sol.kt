class Solution {
    fun bestCoordinate(towers: Array<IntArray>, radius: Int): IntArray {
        var maxX = 0
        var maxY = 0
        for (t in towers) {
            maxX = maxOf(maxX, t[0])
            maxY = maxOf(maxY, t[1])
        }
        
        var bestQuality = 0
        var bestCoord = intArrayOf(0, 0)
        
        for (x in 0..maxX) {
            for (y in 0..maxY) {
                var quality = 0
                for (t in towers) {
                    val dist = Math.sqrt(((t[0] - x) * (t[0] - x) + (t[1] - y) * (t[1] - y)).toDouble())
                    if (dist <= radius) {
                        quality += (t[2] / (1 + dist)).toInt()
                    }
                }
                if (quality > bestQuality || (quality == bestQuality && (x < bestCoord[0] || (x == bestCoord[0] && y < bestCoord[1])))) {
                    bestQuality = quality
                    bestCoord[0] = x
                    bestCoord[1] = y
                }
            }
        }
        
        return bestCoord
    }
}
