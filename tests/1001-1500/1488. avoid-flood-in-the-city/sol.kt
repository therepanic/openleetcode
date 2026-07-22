import java.util.*

class Solution {
    fun avoidFlood(rains: IntArray): IntArray {
        val n = rains.size
        val res = IntArray(n) { -1 }
        val full = mutableMapOf<Int, Int>()
        val dry = TreeSet<Int>()
        for (i in 0 until n) {
            val lake = rains[i]
            if (lake == 0) {
                dry.add(i)
                res[i] = 1
            } else if (full.containsKey(lake)) {
                val j = dry.higher(full[lake]!!) ?: return intArrayOf()
                res[j] = lake
                dry.remove(j)
                full[lake] = i
            } else {
                full[lake] = i
            }
        }
        return res
    }
}
