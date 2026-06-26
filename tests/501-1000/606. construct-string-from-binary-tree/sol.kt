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
    fun tree2str(root: TreeNode?): String {
        if (root == null) return ""
        val sb = StringBuilder()
        sb.append(root.`val`)
        if (root.left != null || root.right != null) {
            sb.append("(")
            sb.append(tree2str(root.left))
            sb.append(")")
        }
        if (root.right != null) {
            sb.append("(")
            sb.append(tree2str(root.right))
            sb.append(")")
        }
        return sb.toString()
    }
}
