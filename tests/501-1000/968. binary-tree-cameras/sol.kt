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
    fun minCameraCover(root: TreeNode?): Int {
        fun dfs(node: TreeNode?): Int {
            if (node == null) return 0
            val res = dfs(node.left) + dfs(node.right)
            val curr = minOf(
                node.left?.`val` ?: Int.MAX_VALUE,
                node.right?.`val` ?: Int.MAX_VALUE
            )
            if (curr == 0) {
                node.`val` = 1
                return res + 1
            } else if (curr == 1) {
                node.`val` = 2
            }
            return res
        }
        return dfs(root) + (if (root?.`val` == 0) 1 else 0)
    }
}
