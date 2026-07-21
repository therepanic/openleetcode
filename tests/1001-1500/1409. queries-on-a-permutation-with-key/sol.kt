class Solution {
    fun processQueries(queries: IntArray, m: Int): IntArray {
        val ans = IntArray(queries.size)
        val arr = mutableListOf<Int>()
        for (i in 1..m) {
            arr.add(i)
        }
        for (i in queries.indices) {
            val x = queries[i]
            val idx = arr.indexOf(x)
            ans[i] = idx
            arr.removeAt(idx)
            arr.add(0, x)
        }
        return ans
    }
}
