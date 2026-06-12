
class Solution {
    fun getRow(rowIndex: Int): IntArray {
        var row = intArrayOf(1)
        repeat(rowIndex) {
            val next = IntArray(row.size + 1) { 1 }
            for (j in 1 until row.size) {
                next[j] = row[j - 1] + row[j]
            }
            row = next
        }
        return row
    }
}
