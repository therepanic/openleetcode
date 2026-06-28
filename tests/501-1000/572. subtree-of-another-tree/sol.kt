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
    fun isSubtree(root: TreeNode?, subRoot: TreeNode?): Boolean {
        fun ser(n: TreeNode?): String {
            if (n == null) return ",#"
            return ",${n.`val`}${ser(n.left)}${ser(n.right)}"
        }
        return ser(root).contains(ser(subRoot))
    }
}
