class Solution {
    fun minInteger(num: String, k: Int): String {
        val n = num.length
        val dict = mutableMapOf<Char, ArrayDeque<Int>>()
        for (i in 0 until n) {
            val ch = num[i]
            dict.getOrPut(ch) { ArrayDeque() }.addLast(i)
        }
        
        val bit = IntArray(n + 1)
        fun update(i: Int, v: Int) {
            var idx = i
            while (idx < bit.size) {
                bit[idx] += v
                idx += idx and -idx
            }
        }
        fun query(i: Int): Int {
            var total = 0
            var idx = i
            while (idx > 0) {
                total += bit[idx]
                idx -= idx and -idx
            }
            return total
        }
        
        for (i in 1..n) update(i, 1)
        var kk = k
        val res = StringBuilder()
        for (pos in 0 until n) {
            for (v in '0'..'9') {
                val dq = dict[v]
                if (dq != null && dq.isNotEmpty()) {
                    val idx = dq.first()
                    val cnt = query(idx)
                    if (cnt <= kk) {
                        dq.removeFirst()
                        kk -= cnt
                        res.append(v)
                        update(idx + 1, -1)
                        break
                    }
                }
            }
        }
        return res.toString()
    }
}
