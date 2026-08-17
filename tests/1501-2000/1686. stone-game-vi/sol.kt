class Solution {
    fun stoneGameVI(aliceValues: IntArray, bobValues: IntArray): Int {
        val n = aliceValues.size
        val combined = Array(n) { IntArray(3) }
        for (i in 0 until n) {
            combined[i][0] = aliceValues[i] + bobValues[i]
            combined[i][1] = aliceValues[i]
            combined[i][2] = bobValues[i]
        }
        combined.sortByDescending { it[0] }

        var alice = 0
        var bob = 0
        for (i in 0 until n) {
            if (i % 2 == 0) {
                alice += combined[i][1]
            } else {
                bob += combined[i][2]
            }
        }

        return when {
            alice > bob -> 1
            alice < bob -> -1
            else -> 0
        }
    }
}
