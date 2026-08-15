class Solution {
    fun countPoints(points: Array<IntArray>, queries: Array<IntArray>): IntArray {
        val result = IntArray(queries.size)
        for (i in queries.indices) {
            for (j in points.indices) {
                if ((Math.pow((queries[i][0] - points[j][0]).toDouble(), 2.0) + Math.pow((queries[i][1] - points[j][1]).toDouble(), 2.0)) <= Math.pow(queries[i][2].toDouble(), 2.0)) {
                    result[i]++
                }
            }
        }
        return result
    }
}
