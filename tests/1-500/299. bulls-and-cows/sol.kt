class Solution {
    fun getHint(secret: String, guess: String): String {
        var bulls = 0
        val secretCounts = IntArray(10)
        val guessCounts = IntArray(10)

        for (i in secret.indices) {
            val s = secret[i]
            val g = guess[i]
            if (s == g) {
                bulls++
            } else {
                secretCounts[s - '0']++
                guessCounts[g - '0']++
            }
        }

        var cows = 0
        for (i in 0..9) {
            cows += minOf(secretCounts[i], guessCounts[i])
        }
        return "${bulls}A${cows}B"
    }
}
