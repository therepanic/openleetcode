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
    fun isUnivalTree(root: TreeNode?): Boolean {
        if (root == null) {
            return true
        }
        val left = root.left
        val right = root.right
        if (left != null && left.`val` != root.`val`) {
            return false
        }
        if (right != null && right.`val` != root.`val`) {
            return false
        }
        return isUnivalTree(left) && isUnivalTree(right)
    }
}
