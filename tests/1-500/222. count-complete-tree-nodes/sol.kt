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
    fun countNodes(root: TreeNode?): Int {
        if (root == null) {
            return 0
        }
        
        val leftDepth = getDepth(root.left)
        val rightDepth = getDepth(root.right)
        
        return if (leftDepth == rightDepth) {
            (1 shl leftDepth) + countNodes(root.right)
        } else {
            (1 shl rightDepth) + countNodes(root.left)
        }
    }
    
    private fun getDepth(node: TreeNode?): Int {
        var depth = 0
        var current = node
        while (current != null) {
            depth++
            current = current.left
        }
        return depth
    }
}
