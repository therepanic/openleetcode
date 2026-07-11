class Solution {
    fun splitIntoFibonacci(num: String): List<Int> {
        fun invalid(x: String): Boolean {
            if (x[0] == '0' && x.length > 1) return true
            if (x.length > 10) return true
            return x.toLongOrNull()?.let { it >= (1L shl 31) } ?: true
        }
        
        fun check(a0: String, a1: String, num: String): List<Int> {
            var i = 0
            val ret = mutableListOf(a0.toInt(), a1.toInt())
            var curA0 = a0
            var curA1 = a1
            while (i < num.length) {
                val sum = curA0.toLong() + curA1.toLong()
                val res = sum.toString()
                var j = 0
                while (i < num.length && j < res.length && res[j] == num[i]) {
                    j++
                    i++
                }
                if (j < res.length || invalid(res)) return emptyList()
                curA0 = curA1
                curA1 = res
                ret.add(res.toInt())
            }
            return ret
        }
        
        val n = num.length
        for (j in 1 until n - 1) {
            for (i in 0 until j) {
                val a0 = num.substring(0, i + 1)
                val a1 = num.substring(i + 1, j + 1)
                if (invalid(a0) || invalid(a1)) continue
                val ret = check(a0, a1, num.substring(j + 1))
                if (ret.isNotEmpty()) return ret
            }
        }
        return emptyList()
    }
}
