class Solution {
    fun isCovered(ranges: Array<IntArray>, left: Int, right: Int): Boolean {
        val slots = IntArray(51)
        for (range in ranges) {
            val s = range[0]
            val e = range[1]
            for (i in s..e) {
                slots[i] = 1
            }
        }
        for (i in left..right) {
            if (slots[i] == 0) return false
        }
        return true
    }
}
