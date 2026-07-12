class Solution {
    fun kClosest(points: Array<IntArray>, k: Int): Array<IntArray> {
        points.sortBy { 1L * it[0] * it[0] + 1L * it[1] * it[1] }
        return points.copyOfRange(0, k)
    }
}
