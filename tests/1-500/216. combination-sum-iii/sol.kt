class Solution {
    fun combinationSum3(k: Int, n: Int): List<List<Int>> {
        val res = mutableListOf<List<Int>>()
        fun backtrack(start: Int, path: MutableList<Int>, target: Int, k: Int) {
            if (target == 0 && k == 0) {
                res.add(path.toList())
                return
            }
            for (i in start..9) {
                if (i > target || k <= 0) break
                path.add(i)
                backtrack(i + 1, path, target - i, k - 1)
                path.removeAt(path.size - 1)
            }
        }
        backtrack(1, mutableListOf(), n, k)
        return res
    }
}
