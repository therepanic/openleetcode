class Solution {
    fun modifyString(s: String): String {
        val arr = s.toCharArray()
        val n = arr.size
        for (i in 0 until n) {
            if (arr[i] == '?') {
                val left = if (i > 0) arr[i-1] else ' '
                val right = if (i+1 < n) arr[i+1] else ' '
                arr[i] = when {
                    left != 'a' && right != 'a' -> 'a'
                    left != 'b' && right != 'b' -> 'b'
                    else -> 'c'
                }
            }
        }
        return String(arr)
    }
}
