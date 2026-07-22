class Solution {
    fun numberWays(hats: Array<IntArray>): Int {
        return numberWays(hats.map { it.toList() })
    }

    fun numberWays(hats: List<List<Int>>): Int {
        val mod = 1_000_000_007
        val n = hats.size
        val likedByHat = Array(41) { mutableListOf<Int>() }
        for (person in hats.indices) {
            for (hat in hats[person]) {
                likedByHat[hat].add(person)
            }
        }
        
        var dp = IntArray(1 shl n)
        dp[0] = 1
        for (hat in 1..40) {
            val updated = dp.clone()
            for (mask in dp.indices) {
                val count = dp[mask]
                if (count == 0) continue
                for (person in likedByHat[hat]) {
                    val personBit = 1 shl person
                    if (mask and personBit == 0) {
                        val target = mask or personBit
                        updated[target] = (updated[target] + count) % mod
                    }
                }
            }
            dp = updated
        }
        return dp.last()
    }
}
