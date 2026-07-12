class Solution {
    fun sampleStats(count: IntArray): DoubleArray {
        fun kth(k: Int): Int {
            var acc = 0
            for (v in count.indices) {
                acc += count[v]
                if (acc >= k) {
                    return v
                }
            }
            return 0
        }

        var tot = 0
        var cnt = 0L
        var mini: Int? = null
        var maxi = 0
        var mode = 0
        var modeCnt = 0

        for (v in count.indices) {
            val c = count[v]
            if (c > 0) {
                if (mini == null) {
                    mini = v
                }
                maxi = v
                tot += c
                cnt += v.toLong() * c
                if (c > modeCnt) {
                    modeCnt = c
                    mode = v
                }
            }
        }

        val m = if (tot % 2 == 1) {
            kth(tot / 2 + 1).toDouble()
        } else {
            (kth(tot / 2) + kth(tot / 2 + 1)) / 2.0
        }

        return doubleArrayOf(mini!!.toDouble(), maxi.toDouble(), cnt.toDouble() / tot, m, mode.toDouble())
    }
}
