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
    fun sumOfLeftLeaves(root: TreeNode?): Int {
        fun dfs(node: TreeNode?, isLeft: Boolean): Int {
            if (node == null) return 0
            if (node.left == null && node.right == null) {
                return if (isLeft) node.`val` else 0
            }
            return dfs(node.left, true) + dfs(node.right, false)
        }
        return dfs(root, false)
    }
}
