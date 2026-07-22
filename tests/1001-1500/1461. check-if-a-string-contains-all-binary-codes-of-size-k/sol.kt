class Solution {
    fun hasAllCodes(s: String, k: Int): Boolean {
        var req = 1 shl k
        val seen = BooleanArray(req)
        val mask = req - 1
        var h = 0

        for (i in s.indices) {
            h = ((h shl 1) and mask) or (s[i].code and 1)

            if (i >= k - 1 && !seen[h]) {
                seen[h] = true
                req--
                if (req == 0) return true
            }
        }

        return false
    }
}
