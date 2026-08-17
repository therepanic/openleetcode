/**
 * Example:
 * var ti = TreeNode(5)
 * var v = ti.`val`
 * Definition for a binary tree node.
 * class TreeNode(var `val`: Int) {
 *     var left: TreeNode? = null
 *     var right: TreeNode? = null
 * }
 */
class Solution {
    fun countPairs(root: TreeNode?, distance: Int): Int {
        val graph = mutableMapOf<TreeNode, MutableList<TreeNode>>()
        fun dfs(node: TreeNode?, parent: TreeNode?) {
            if (node == null) return
            if (parent != null) {
                graph.getOrPut(parent) { mutableListOf() }.add(node)
                graph.getOrPut(node) { mutableListOf() }.add(parent)
            }
            dfs(node.left, node)
            dfs(node.right, node)
        }
        dfs(root, null)

        val leaves = graph.keys.filter { it.left == null && it.right == null }
        var ans = 0

        for (i in leaves.indices) {
            val leaf = leaves[i]
            val q = ArrayDeque<Pair<TreeNode, Int>>()
            val visited = mutableSetOf<TreeNode>()
            q.add(leaf to 0)
            visited.add(leaf)

            while (q.isNotEmpty()) {
                val (node, dist) = q.removeFirst()
                if (dist >= distance) continue
                for (nei in graph[node] ?: emptyList()) {
                    if (nei !in visited) {
                        visited.add(nei)
                        q.add(nei to dist + 1)
                        if (nei in leaves && leaves.indexOf(nei) > i) {
                            ans++
                        }
                    }
                }
            }
        }
        return ans
    }
}
