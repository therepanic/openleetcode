import kotlin.collections.HashMap
import kotlin.collections.HashSet

class Solution {
    fun gridIllumination(n: Int, lamps: Array<IntArray>, queries: Array<IntArray>): IntArray {
        val rowCount = HashMap<Int, Int>()
        val colCount = HashMap<Int, Int>()
        val diag1 = HashMap<Int, Int>()
        val diag2 = HashMap<Int, Int>()
        val lampSet = HashSet<Long>()
        val ans = IntArray(queries.size)
        val dirs = arrayOf(intArrayOf(-1,-1), intArrayOf(-1,0), intArrayOf(-1,1),
                           intArrayOf(0,-1),  intArrayOf(0,0),  intArrayOf(0,1),
                           intArrayOf(1,-1),  intArrayOf(1,0),  intArrayOf(1,1))
        
        for (lamp in lamps) {
            val r = lamp[0]; val c = lamp[1]
            val key = (r.toLong() shl 32) or (c.toLong() and 0xFFFFFFFFL)
            if (!lampSet.contains(key)) {
                lampSet.add(key)
                rowCount[r] = rowCount.getOrDefault(r, 0) + 1
                colCount[c] = colCount.getOrDefault(c, 0) + 1
                diag1[r - c] = diag1.getOrDefault(r - c, 0) + 1
                diag2[r + c] = diag2.getOrDefault(r + c, 0) + 1
            }
        }
        
        for (i in queries.indices) {
            val r = queries[i][0]; val c = queries[i][1]
            if ((rowCount[r] ?: 0) > 0 || (colCount[c] ?: 0) > 0 ||
                (diag1[r - c] ?: 0) > 0 || (diag2[r + c] ?: 0) > 0) {
                ans[i] = 1
                for (d in dirs) {
                    val nr = r + d[0]; val nc = c + d[1]
                    val key = (nr.toLong() shl 32) or (nc.toLong() and 0xFFFFFFFFL)
                    if (lampSet.contains(key)) {
                        lampSet.remove(key)
                        rowCount[nr] = rowCount[nr]!! - 1
                        colCount[nc] = colCount[nc]!! - 1
                        diag1[nr - nc] = diag1[nr - nc]!! - 1
                        diag2[nr + nc] = diag2[nr + nc]!! - 1
                    }
                }
            } else {
                ans[i] = 0
            }
        }
        return ans
    }
}
