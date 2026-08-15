class Solution {
    fun maximumBinaryString(binary: String): String {
        val n = binary.length
        val z = binary.count { it == '0' }
        
        if (z < 2) return binary
        
        val firstZero = binary.indexOf('0')
        val p = firstZero + z - 1
        
        return "1".repeat(p) + "0" + "1".repeat(n - p - 1)
    }
}
