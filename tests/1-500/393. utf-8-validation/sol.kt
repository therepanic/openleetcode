class Solution {
    fun validUtf8(data: IntArray): Boolean {
        var i = 0
        while (i < data.size) {
            val b = data[i]
            when {
                b shr 7 == 0 -> i++
                b shr 5 == 0b110 -> {
                    if (i + 1 >= data.size) return false
                    if (data[i+1] shr 6 != 0b10) return false
                    i += 2
                }
                b shr 4 == 0b1110 -> {
                    if (i + 2 >= data.size) return false
                    if (data[i+1] shr 6 != 0b10 || data[i+2] shr 6 != 0b10) return false
                    i += 3
                }
                b shr 3 == 0b11110 -> {
                    if (i + 3 >= data.size) return false
                    if (data[i+1] shr 6 != 0b10 || data[i+2] shr 6 != 0b10 || data[i+3] shr 6 != 0b10) return false
                    i += 4
                }
                else -> return false
            }
        }
        return true
    }
}
