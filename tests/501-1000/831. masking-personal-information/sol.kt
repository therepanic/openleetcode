class Solution {
    fun maskPII(s: String): String {
        if ("@" in s) {
            val parts = s.split("@")
            var name = parts[0].lowercase()
            val domain = parts[1].lowercase()
            name = name[0] + "*****" + name[name.length - 1]
            return name + "@" + domain
        } else {
            var gg = ""
            for (x in s) {
                if (x.isDigit()) {
                    gg += x
                }
            }
            val l = gg.length
            if (l > 10) {
                return "+" + "*".repeat(l - 10) + "-***-***-" + gg.substring(l - 4)
            }
            return "***-***-" + gg.substring(l - 4)
        }
    }
}
