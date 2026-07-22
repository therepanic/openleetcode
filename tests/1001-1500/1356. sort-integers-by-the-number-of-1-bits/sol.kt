class Solution {
    fun sortByBits(arr: IntArray): IntArray {
        return arr.sortedWith(compareBy<Int> { it.countOneBits() }.thenBy { it }).toIntArray()
    }
}
