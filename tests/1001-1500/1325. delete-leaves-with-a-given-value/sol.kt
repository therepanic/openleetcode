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
    fun removeLeafNodes(root: TreeNode?, target: Int): TreeNode? {
        fun traverseAndRemove(temp: TreeNode?): Boolean {
            if (temp == null) {
                return false
            }
            if (temp.left == null && temp.right == null) {
                return temp.`val` != target
            }
            val left = traverseAndRemove(temp.left)
            val right = traverseAndRemove(temp.right)
            if (!left) {
                temp.left = null
            }
            if (!right) {
                temp.right = null
            }
            return left || right || temp.`val` != target
        }
        
        if (!traverseAndRemove(root)) {
            return null
        }
        return root
    }
}
