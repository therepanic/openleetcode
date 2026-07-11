class Solution {
    fun flipgame(fronts: IntArray, backs: IntArray): Int {
        val bad = HashSet<Int>()
        for (i in fronts.indices) {
            if (fronts[i] == backs[i]) {
                bad.add(fronts[i])
            }
        }
        var best = 2001
        for (i in fronts.indices) {
            if (fronts[i] !in bad && fronts[i] < best) {
                best = fronts[i]
            }
            if (backs[i] !in bad && backs[i] < best) {
                best = backs[i]
            }
        }
        return if (best <= 2000) best else 0
    }
}
