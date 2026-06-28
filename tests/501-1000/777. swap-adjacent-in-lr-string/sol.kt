class Solution {
    fun canTransform(start: String, result: String): Boolean {
        val n = start.length
        var i = 0
        var j = 0

        while (i < n || j < n) {
            while (i < n && start[i] == 'X') {
                i++
            }
            while (j < n && result[j] == 'X') {
                j++
            }

            if ((i == n) xor (j == n)) {
                return false
            }

            if (i < n && j < n) {
                if (start[i] != result[j]) {
                    return false
                }
                if (start[i] == 'L' && j > i) {
                    return false
                }
                if (start[i] == 'R' && j < i) {
                    return false
                }
            }

            i++
            j++
        }

        return true
    }
}
