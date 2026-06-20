class Solution {
    fun rangeBitwiseAnd(left: Int, right: Int): Int {
        var currentLeft = left
        var currentRight = right
        var shift = 0
        while (currentLeft < currentRight) {
            currentLeft = currentLeft shr 1
            currentRight = currentRight shr 1
            shift++
        }
        return currentLeft shl shift
    }
}
