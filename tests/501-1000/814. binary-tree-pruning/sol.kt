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
    fun pruneTree(root: TreeNode?): TreeNode? {
        fun traverseAndRemove(temp: TreeNode?): Boolean {
            if (temp == null) {
                return false
            }
            if (temp.left == null && temp.right == null) {
                return temp.`val` == 1
            }
            val left = traverseAndRemove(temp.left)
            val right = traverseAndRemove(temp.right)
            if (!left) {
                temp.left = null
            }
            if (!right) {
                temp.right = null
            }
            return left || right || temp.`val` == 1
        }
        
        traverseAndRemove(root)
        if (root != null && root.left == null && root.right == null && root.`val` == 0) {
            return null
        }
        return root
    }
}
