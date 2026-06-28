class Solution {
    fun findClosestElements(arr: IntArray, k: Int, x: Int): List<Int> {
        return arr.toList()
            .sortedWith(compareBy<Int> { Math.abs(it - x) }.thenBy { it })
            .take(k)
            .sorted()
    }
}
