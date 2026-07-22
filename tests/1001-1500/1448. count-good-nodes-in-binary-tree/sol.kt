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
    fun goodNodes(root: TreeNode?): Int {
        fun dfs(node: TreeNode?, maxSoFar: Int): Int {
            if (node == null) return 0
            var count = if (node.`val` >= maxSoFar) 1 else 0
            val newMax = maxOf(maxSoFar, node.`val`)
            count += dfs(node.left, newMax)
            count += dfs(node.right, newMax)
            return count
        }
        return dfs(root, root!!.`val`)
    }
}
