class Solution {
    fun smallestSufficientTeam(req_skills: Array<String>, people: List<List<String>>): IntArray {
        val index = req_skills.withIndex().associate { it.value to it.index }
        val best = mutableMapOf(0 to IntArray(0))
        for ((person, skills) in people.withIndex()) {
            var mask = 0
            for (skill in skills) index[skill]?.let { mask = mask or (1 shl it) }
            for ((oldMask, team) in best.toMap()) {
                val newMask = oldMask or mask
                if (newMask == oldMask) continue
                val candidate = team + person
                if (best[newMask] == null || candidate.size < best[newMask]!!.size) {
                    best[newMask] = candidate
                }
            }
        }
        return best[(1 shl req_skills.size) - 1]!!
    }
}
