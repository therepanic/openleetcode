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
    private var sum = 0
    
    fun bstToGst(root: TreeNode?): TreeNode? {
        traversal(root)
        return root
    }
    
    private fun traversal(node: TreeNode?) {
        if (node == null) return
        if (node.right != null) {
            traversal(node.right)
        }
        sum += node.`val`
        node.`val` = sum
        if (node.left != null) {
            traversal(node.left)
        }
    }
}
