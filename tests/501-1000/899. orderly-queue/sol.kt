class Solution {
    fun orderlyQueue(s: String, k: Int): String {
        if (k > 1) {
            return s.toCharArray().sorted().joinToString("")
        }
        
        var res = s
        var current = s
        for (i in 0 until s.length) {
            current = current.substring(1) + current[0]
            if (current < res) {
                res = current
            }
        }
        
        return res
    }
}
