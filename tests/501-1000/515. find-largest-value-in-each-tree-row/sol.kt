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
    fun largestValues(root: TreeNode?): List<Int> {
        val res = mutableListOf<Int>()
        fun dfs(node: TreeNode?, level: Int) {
            if (node == null) return
            if (level == res.size) {
                res.add(node.`val`)
            } else {
                res[level] = maxOf(res[level], node.`val`)
            }
            dfs(node.left, level + 1)
            dfs(node.right, level + 1)
        }
        dfs(root, 0)
        return res
    }
}
