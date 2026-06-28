class Solution {
    fun outerTrees(trees: Array<IntArray>): Array<IntArray> {
        if (trees.size == 1) {
            return trees
        }

        trees.sortWith(compareBy({ it[0] }, { it[1] }))

        val lower = mutableListOf<IntArray>()
        for (p in trees) {
            while (lower.size >= 2 && cross(lower[lower.size - 2], lower[lower.size - 1], p) < 0) {
                lower.removeAt(lower.size - 1)
            }
            lower.add(p)
        }

        val upper = mutableListOf<IntArray>()
        for (i in trees.size - 1 downTo 0) {
            val p = trees[i]
            while (upper.size >= 2 && cross(upper[upper.size - 2], upper[upper.size - 1], p) < 0) {
                upper.removeAt(upper.size - 1)
            }
            upper.add(p)
        }

        lower.removeAt(lower.size - 1)
        upper.removeAt(upper.size - 1)
        lower.addAll(upper)

        return lower.distinctBy { "${it[0]},${it[1]}" }.toTypedArray()
    }

    private fun cross(o: IntArray, a: IntArray, b: IntArray): Int {
        return (a[0] - o[0]) * (b[1] - o[1]) - (a[1] - o[1]) * (b[0] - o[0])
    }
}
