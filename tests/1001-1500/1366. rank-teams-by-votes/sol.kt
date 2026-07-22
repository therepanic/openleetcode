class Solution {
    fun rankTeams(votes: Array<String>): String {
        val teams = votes[0]
        val n = teams.length
        val positions = mutableMapOf<Char, IntArray>()
        for (team in teams) {
            positions[team] = IntArray(n)
        }
        for (vote in votes) {
            for ((index, team) in vote.withIndex()) {
                positions[team]!![index]++
            }
        }
        return teams.toCharArray()
            .sortedWith(Comparator { a, b ->
                val countsA = positions[a]!!
                val countsB = positions[b]!!
                for (i in 0 until n) {
                    if (countsA[i] != countsB[i]) {
                        return@Comparator countsB[i] - countsA[i]
                    }
                }
                a - b
            })
            .joinToString("")
    }
}
