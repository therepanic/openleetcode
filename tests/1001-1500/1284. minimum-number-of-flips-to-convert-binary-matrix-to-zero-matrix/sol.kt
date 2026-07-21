import java.util.ArrayDeque

class Solution {
    fun minFlips(mat: Array<IntArray>): Int {
        val m = mat.size
        val n = mat[0].size
        val masks = IntArray(m * n)
        var p = 0

        val dirs = arrayOf(
            intArrayOf(0, 0),
            intArrayOf(1, 0),
            intArrayOf(-1, 0),
            intArrayOf(0, 1),
            intArrayOf(0, -1)
        )

        for (r in 0 until m) {
            for (c in 0 until n) {
                var mask = 0
                for (d in dirs) {
                    val nr = r + d[0]
                    val nc = c + d[1]
                    if (nr in 0 until m && nc in 0 until n) {
                        mask = mask or (1 shl (nr * n + nc))
                    }
                }
                masks[p++] = mask
            }
        }

        var start = 0
        for (r in 0 until m) {
            for (c in 0 until n) {
                if (mat[r][c] == 1) {
                    start = start or (1 shl (r * n + c))
                }
            }
        }

        val size = 1 shl (m * n)
        val dist = IntArray(size) { -1 }
        val q = ArrayDeque<Int>()
        dist[start] = 0
        q.addLast(start)

        while (q.isNotEmpty()) {
            val state = q.removeFirst()
            val steps = dist[state]
            if (state == 0) {
                return steps
            }
            for (mask in masks) {
                val next = state xor mask
                if (dist[next] == -1) {
                    dist[next] = steps + 1
                    q.addLast(next)
                }
            }
        }

        return -1
    }
}
