class Solution {
    fun compress(chars: CharArray): Int {
        var i = 0
        var j = 0
        while (j < chars.size) {
            val c = chars[j]
            var count = 0
            while (j < chars.size && chars[j] == c) {
                j++
                count++
            }
            chars[i++] = c
            if (count > 1) {
                for (ch in count.toString()) {
                    chars[i++] = ch
                }
            }
        }
        return i
    }
}
