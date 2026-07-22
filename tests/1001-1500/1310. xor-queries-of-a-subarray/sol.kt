class Solution {
    fun xorQueries(arr: IntArray, queries: Array<IntArray>): IntArray {
        val n = arr.size
        val prefix = IntArray(n + 1)
        for (i in 0 until n) {
            prefix[i + 1] = prefix[i] xor arr[i]
        }
        return queries.map { (a, b) -> prefix[b + 1] xor prefix[a] }.toIntArray()
    }
}
