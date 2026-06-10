
class Solution {
    fun generate(numRows: Int): Array<IntArray> {
        val result = ArrayList<IntArray>()
        for (i in 0 until numRows) {
            val row = IntArray(i + 1) { 1 }
            for (j in 1 until i) {
                row[j] = result[i - 1][j - 1] + result[i - 1][j]
            }
            result.add(row)
        }
        return result.toTypedArray()
    }
}
