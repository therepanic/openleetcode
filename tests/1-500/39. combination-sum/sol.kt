class Solution {
    fun combinationSum(candidates: IntArray, target: Int): List<List<Int>> {
        candidates.sort()
        val res = mutableListOf<List<Int>>()
        dfs(0, target, candidates, mutableListOf(), res)
        return res
    }

    private fun dfs(
        start: Int,
        target: Int,
        candidates: IntArray,
        cur: MutableList<Int>,
        res: MutableList<List<Int>>
    ) {
        if (target == 0) {
            res.add(cur.toList())
            return
        }

        for (i in start until candidates.size) {
            if (candidates[i] > target) break
            cur.add(candidates[i])
            dfs(i, target - candidates[i], candidates, cur, res)
            cur.removeAt(cur.size - 1)
        }
    }
}
