class Solution {
    fun soupServings(n: Int): Double {
        if (n > 5000) {
            return 1.0
        }
        val units = Math.ceil(n / 25.0).toInt()
        val memo = mutableMapOf<Pair<Int, Int>, Double>()
        
        fun calcProb(soupA: Int, soupB: Int): Double {
            val key = Pair(soupA, soupB)
            memo[key]?.let { return it }
            if (soupA <= 0 && soupB <= 0) return 0.5
            if (soupA <= 0) return 1.0
            if (soupB <= 0) return 0.0
            val result = 0.25 * (
                calcProb(soupA - 4, soupB) +
                calcProb(soupA - 3, soupB - 1) +
                calcProb(soupA - 2, soupB - 2) +
                calcProb(soupA - 1, soupB - 3)
            )
            memo[key] = result
            return result
        }
        
        return calcProb(units, units)
    }
}
