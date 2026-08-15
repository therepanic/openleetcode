class Solution {
    fun numberOfRounds(loginTime: String, logoutTime: String): Int {
        fun toMinutes(t: String): Int {
            val parts = t.split(":")
            return parts[0].toInt() * 60 + parts[1].toInt()
        }

        val start = toMinutes(loginTime)
        var end = toMinutes(logoutTime)

        if (end < start) {
            end += 24 * 60
        }

        val startRound = (start + 14) / 15
        val endRound = end / 15

        return maxOf(0, endRound - startRound)
    }
}
