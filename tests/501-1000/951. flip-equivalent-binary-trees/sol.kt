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
    fun flipEquiv(root1: TreeNode?, root2: TreeNode?): Boolean {
        if (root1 == null && root2 == null) {
            return true
        } else if (root1 == null || root2 == null || root1.`val` != root2.`val`) {
            return false
        } else {
            val noFlip = flipEquiv(root1.left, root2.left) && flipEquiv(root1.right, root2.right)
            val yesFlip = flipEquiv(root1.left, root2.right) && flipEquiv(root1.right, root2.left)
            return noFlip || yesFlip
        }
    }
}
