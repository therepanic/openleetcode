class Solution {
    fun validIPAddress(queryIP: String): String {
        if (queryIP.count { it == '.' } == 3) {
            val parts = queryIP.split(".")
            var valid = true
            for (p in parts) {
                if (p.isEmpty() || !p.all { it.isDigit() }) {
                    valid = false
                    break
                }
                val num = p.toIntOrNull() ?: return "Neither"
                if (num < 0 || num > 255 || num.toString() != p) {
                    valid = false
                    break
                }
            }
            if (valid) return "IPv4"
        } else if (queryIP.count { it == ':' } == 7) {
            val parts = queryIP.split(":")
            var valid = true
            val hexChars = setOf('0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f','A','B','C','D','E','F')
            for (p in parts) {
                if (p.length < 1 || p.length > 4) {
                    valid = false
                    break
                }
                if (!p.all { it in hexChars }) {
                    valid = false
                    break
                }
            }
            if (valid) return "IPv6"
        }
        return "Neither"
    }
}
