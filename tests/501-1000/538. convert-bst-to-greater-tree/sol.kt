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
    private var total = 0
    
    fun convertBST(root: TreeNode?): TreeNode? {
        traverse(root)
        return root
    }
    
    private fun traverse(node: TreeNode?) {
        if (node == null) {
            return
        }
        traverse(node.right)
        total += node.`val`
        node.`val` = total
        traverse(node.left)
    }
}
