class Solution {
    fun maxEnvelopes(envelopes: Array<IntArray>): Int {
        envelopes.sortWith(compareBy({ it[0] }, { -it[1] }))
        val result = mutableListOf<Int>()
        for ((_, e) in envelopes) {
            var idx = result.binarySearch(e)
            if (idx < 0) idx = -idx - 1
            if (idx == result.size) {
                result.add(e)
            } else {
                result[idx] = e
            }
        }
        return result.size
    }
}
