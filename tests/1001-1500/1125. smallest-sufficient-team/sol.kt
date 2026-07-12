class Solution {
    fun smallestSufficientTeam(req_skills: Array<String>, people: List<List<String>>): IntArray {
        val n = req_skills.size
        val full = (1 shl n) - 1
        val idx = HashMap<String, Int>()
        for (i in req_skills.indices) idx[req_skills[i]] = i

        val masks = IntArray(people.size)
        for (i in people.indices) {
            var mask = 0
            for (skill in people[i]) mask = mask or (1 shl idx[skill]!!)
            masks[i] = mask
        }

        var dp = arrayOfNulls<IntArray>(1 shl n)
        dp[0] = IntArray(0)

        for (i in masks.indices) {
            val pmask = masks[i]
            if (pmask == 0) continue
            val next = dp.copyOf()
            for (mask in 0..full) {
                val team = dp[mask] ?: continue
                val nmask = mask or pmask
                val cand = team + i
                val old = next[nmask]
                if (old == null || cand.size < old.size) next[nmask] = cand
            }
            dp = next
        }

        return dp[full]!!
    }
}
