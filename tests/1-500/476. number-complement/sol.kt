class Solution {
    fun findComplement(num: Int): Int {
        var bit = 1
        var curr = num
        var result = num
        while (curr > 0) {
            result = result xor bit
            bit = bit shl 1
            curr = curr shr 1
        }
        return result
    }
}
